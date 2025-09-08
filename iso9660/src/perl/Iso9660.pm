# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Iso9660;

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

}

sub primary_vol_desc {
    my ($self) = @_;
    return $self->{primary_vol_desc} if ($self->{primary_vol_desc});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(16 * $self->sector_size());
    $self->{primary_vol_desc} = Iso9660::VolDesc->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{primary_vol_desc};
}

sub sector_size {
    my ($self) = @_;
    return $self->{sector_size} if ($self->{sector_size});
    $self->{sector_size} = 2048;
    return $self->{sector_size};
}

########################################################################
package Iso9660::Datetime;

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

    $self->{year} = $self->{_io}->read_u1();
    $self->{month} = $self->{_io}->read_u1();
    $self->{day} = $self->{_io}->read_u1();
    $self->{hour} = $self->{_io}->read_u1();
    $self->{minute} = $self->{_io}->read_u1();
    $self->{sec} = $self->{_io}->read_u1();
    $self->{timezone} = $self->{_io}->read_u1();
}

sub year {
    my ($self) = @_;
    return $self->{year};
}

sub month {
    my ($self) = @_;
    return $self->{month};
}

sub day {
    my ($self) = @_;
    return $self->{day};
}

sub hour {
    my ($self) = @_;
    return $self->{hour};
}

sub minute {
    my ($self) = @_;
    return $self->{minute};
}

sub sec {
    my ($self) = @_;
    return $self->{sec};
}

sub timezone {
    my ($self) = @_;
    return $self->{timezone};
}

########################################################################
package Iso9660::DecDatetime;

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

    $self->{year} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{month} = Encode::decode("ASCII", $self->{_io}->read_bytes(2));
    $self->{day} = Encode::decode("ASCII", $self->{_io}->read_bytes(2));
    $self->{hour} = Encode::decode("ASCII", $self->{_io}->read_bytes(2));
    $self->{minute} = Encode::decode("ASCII", $self->{_io}->read_bytes(2));
    $self->{sec} = Encode::decode("ASCII", $self->{_io}->read_bytes(2));
    $self->{sec_hundreds} = Encode::decode("ASCII", $self->{_io}->read_bytes(2));
    $self->{timezone} = $self->{_io}->read_u1();
}

sub year {
    my ($self) = @_;
    return $self->{year};
}

sub month {
    my ($self) = @_;
    return $self->{month};
}

sub day {
    my ($self) = @_;
    return $self->{day};
}

sub hour {
    my ($self) = @_;
    return $self->{hour};
}

sub minute {
    my ($self) = @_;
    return $self->{minute};
}

sub sec {
    my ($self) = @_;
    return $self->{sec};
}

sub sec_hundreds {
    my ($self) = @_;
    return $self->{sec_hundreds};
}

sub timezone {
    my ($self) = @_;
    return $self->{timezone};
}

########################################################################
package Iso9660::DirEntries;

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

    $self->{entries} = [];
    {
        my $_it;
        do {
            $_it = Iso9660::DirEntry->new($self->{_io}, $self, $self->{_root});
            push @{$self->{entries}}, $_it;
        } until ($_it->len() == 0);
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Iso9660::DirEntry;

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

    $self->{len} = $self->{_io}->read_u1();
    if ($self->len() > 0) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len() - 1);
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Iso9660::DirEntryBody->new($io__raw_body, $self, $self->{_root});
    }
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Iso9660::DirEntryBody;

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

    $self->{len_ext_attr_rec} = $self->{_io}->read_u1();
    $self->{lba_extent} = Iso9660::U4bi->new($self->{_io}, $self, $self->{_root});
    $self->{size_extent} = Iso9660::U4bi->new($self->{_io}, $self, $self->{_root});
    $self->{datetime} = Iso9660::Datetime->new($self->{_io}, $self, $self->{_root});
    $self->{file_flags} = $self->{_io}->read_u1();
    $self->{file_unit_size} = $self->{_io}->read_u1();
    $self->{interleave_gap_size} = $self->{_io}->read_u1();
    $self->{vol_seq_num} = Iso9660::U2bi->new($self->{_io}, $self, $self->{_root});
    $self->{len_file_name} = $self->{_io}->read_u1();
    $self->{file_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_file_name()));
    if ($self->len_file_name() % 2 == 0) {
        $self->{padding} = $self->{_io}->read_u1();
    }
    $self->{rest} = $self->{_io}->read_bytes_full();
}

sub extent_as_dir {
    my ($self) = @_;
    return $self->{extent_as_dir} if ($self->{extent_as_dir});
    if (($self->file_flags() & 2) != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->lba_extent()->le() * $self->_root()->sector_size());
        $self->{_raw_extent_as_dir} = $io->read_bytes($self->size_extent()->le());
        my $io__raw_extent_as_dir = IO::KaitaiStruct::Stream->new($self->{_raw_extent_as_dir});
        $self->{extent_as_dir} = Iso9660::DirEntries->new($io__raw_extent_as_dir, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{extent_as_dir};
}

sub extent_as_file {
    my ($self) = @_;
    return $self->{extent_as_file} if ($self->{extent_as_file});
    if (($self->file_flags() & 2) == 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->lba_extent()->le() * $self->_root()->sector_size());
        $self->{extent_as_file} = $io->read_bytes($self->size_extent()->le());
        $io->seek($_pos);
    }
    return $self->{extent_as_file};
}

sub len_ext_attr_rec {
    my ($self) = @_;
    return $self->{len_ext_attr_rec};
}

sub lba_extent {
    my ($self) = @_;
    return $self->{lba_extent};
}

sub size_extent {
    my ($self) = @_;
    return $self->{size_extent};
}

sub datetime {
    my ($self) = @_;
    return $self->{datetime};
}

sub file_flags {
    my ($self) = @_;
    return $self->{file_flags};
}

sub file_unit_size {
    my ($self) = @_;
    return $self->{file_unit_size};
}

sub interleave_gap_size {
    my ($self) = @_;
    return $self->{interleave_gap_size};
}

sub vol_seq_num {
    my ($self) = @_;
    return $self->{vol_seq_num};
}

sub len_file_name {
    my ($self) = @_;
    return $self->{len_file_name};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub rest {
    my ($self) = @_;
    return $self->{rest};
}

sub _raw_extent_as_dir {
    my ($self) = @_;
    return $self->{_raw_extent_as_dir};
}

########################################################################
package Iso9660::PathTableEntryLe;

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

    $self->{len_dir_name} = $self->{_io}->read_u1();
    $self->{len_ext_attr_rec} = $self->{_io}->read_u1();
    $self->{lba_extent} = $self->{_io}->read_u4le();
    $self->{parent_dir_idx} = $self->{_io}->read_u2le();
    $self->{dir_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_dir_name()));
    if ($self->len_dir_name() % 2 == 1) {
        $self->{padding} = $self->{_io}->read_u1();
    }
}

sub len_dir_name {
    my ($self) = @_;
    return $self->{len_dir_name};
}

sub len_ext_attr_rec {
    my ($self) = @_;
    return $self->{len_ext_attr_rec};
}

sub lba_extent {
    my ($self) = @_;
    return $self->{lba_extent};
}

sub parent_dir_idx {
    my ($self) = @_;
    return $self->{parent_dir_idx};
}

sub dir_name {
    my ($self) = @_;
    return $self->{dir_name};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Iso9660::PathTableLe;

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

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Iso9660::PathTableEntryLe->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Iso9660::U2bi;

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

    $self->{le} = $self->{_io}->read_u2le();
    $self->{be} = $self->{_io}->read_u2be();
}

sub le {
    my ($self) = @_;
    return $self->{le};
}

sub be {
    my ($self) = @_;
    return $self->{be};
}

########################################################################
package Iso9660::U4bi;

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

    $self->{le} = $self->{_io}->read_u4le();
    $self->{be} = $self->{_io}->read_u4be();
}

sub le {
    my ($self) = @_;
    return $self->{le};
}

sub be {
    my ($self) = @_;
    return $self->{be};
}

########################################################################
package Iso9660::VolDesc;

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

    $self->{type} = $self->{_io}->read_u1();
    $self->{magic} = $self->{_io}->read_bytes(5);
    $self->{version} = $self->{_io}->read_u1();
    if ($self->type() == 0) {
        $self->{vol_desc_boot_record} = Iso9660::VolDescBootRecord->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->type() == 1) {
        $self->{vol_desc_primary} = Iso9660::VolDescPrimary->new($self->{_io}, $self, $self->{_root});
    }
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub vol_desc_boot_record {
    my ($self) = @_;
    return $self->{vol_desc_boot_record};
}

sub vol_desc_primary {
    my ($self) = @_;
    return $self->{vol_desc_primary};
}

########################################################################
package Iso9660::VolDescBootRecord;

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

    $self->{boot_system_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(32));
    $self->{boot_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(32));
}

sub boot_system_id {
    my ($self) = @_;
    return $self->{boot_system_id};
}

sub boot_id {
    my ($self) = @_;
    return $self->{boot_id};
}

########################################################################
package Iso9660::VolDescPrimary;

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

    $self->{unused1} = $self->{_io}->read_bytes(1);
    $self->{system_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(32));
    $self->{volume_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(32));
    $self->{unused2} = $self->{_io}->read_bytes(8);
    $self->{vol_space_size} = Iso9660::U4bi->new($self->{_io}, $self, $self->{_root});
    $self->{unused3} = $self->{_io}->read_bytes(32);
    $self->{vol_set_size} = Iso9660::U2bi->new($self->{_io}, $self, $self->{_root});
    $self->{vol_seq_num} = Iso9660::U2bi->new($self->{_io}, $self, $self->{_root});
    $self->{logical_block_size} = Iso9660::U2bi->new($self->{_io}, $self, $self->{_root});
    $self->{path_table_size} = Iso9660::U4bi->new($self->{_io}, $self, $self->{_root});
    $self->{lba_path_table_le} = $self->{_io}->read_u4le();
    $self->{lba_opt_path_table_le} = $self->{_io}->read_u4le();
    $self->{lba_path_table_be} = $self->{_io}->read_u4be();
    $self->{lba_opt_path_table_be} = $self->{_io}->read_u4be();
    $self->{_raw_root_dir} = $self->{_io}->read_bytes(34);
    my $io__raw_root_dir = IO::KaitaiStruct::Stream->new($self->{_raw_root_dir});
    $self->{root_dir} = Iso9660::DirEntry->new($io__raw_root_dir, $self, $self->{_root});
    $self->{vol_set_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(128));
    $self->{publisher_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(128));
    $self->{data_preparer_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(128));
    $self->{application_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(128));
    $self->{copyright_file_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(38));
    $self->{abstract_file_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(36));
    $self->{bibliographic_file_id} = Encode::decode("UTF-8", $self->{_io}->read_bytes(37));
    $self->{vol_create_datetime} = Iso9660::DecDatetime->new($self->{_io}, $self, $self->{_root});
    $self->{vol_mod_datetime} = Iso9660::DecDatetime->new($self->{_io}, $self, $self->{_root});
    $self->{vol_expire_datetime} = Iso9660::DecDatetime->new($self->{_io}, $self, $self->{_root});
    $self->{vol_effective_datetime} = Iso9660::DecDatetime->new($self->{_io}, $self, $self->{_root});
    $self->{file_structure_version} = $self->{_io}->read_u1();
    $self->{unused4} = $self->{_io}->read_u1();
    $self->{application_area} = $self->{_io}->read_bytes(512);
}

sub path_table {
    my ($self) = @_;
    return $self->{path_table} if ($self->{path_table});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->lba_path_table_le() * $self->_root()->sector_size());
    $self->{_raw_path_table} = $self->{_io}->read_bytes($self->path_table_size()->le());
    my $io__raw_path_table = IO::KaitaiStruct::Stream->new($self->{_raw_path_table});
    $self->{path_table} = Iso9660::PathTableLe->new($io__raw_path_table, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{path_table};
}

sub unused1 {
    my ($self) = @_;
    return $self->{unused1};
}

sub system_id {
    my ($self) = @_;
    return $self->{system_id};
}

sub volume_id {
    my ($self) = @_;
    return $self->{volume_id};
}

sub unused2 {
    my ($self) = @_;
    return $self->{unused2};
}

sub vol_space_size {
    my ($self) = @_;
    return $self->{vol_space_size};
}

sub unused3 {
    my ($self) = @_;
    return $self->{unused3};
}

sub vol_set_size {
    my ($self) = @_;
    return $self->{vol_set_size};
}

sub vol_seq_num {
    my ($self) = @_;
    return $self->{vol_seq_num};
}

sub logical_block_size {
    my ($self) = @_;
    return $self->{logical_block_size};
}

sub path_table_size {
    my ($self) = @_;
    return $self->{path_table_size};
}

sub lba_path_table_le {
    my ($self) = @_;
    return $self->{lba_path_table_le};
}

sub lba_opt_path_table_le {
    my ($self) = @_;
    return $self->{lba_opt_path_table_le};
}

sub lba_path_table_be {
    my ($self) = @_;
    return $self->{lba_path_table_be};
}

sub lba_opt_path_table_be {
    my ($self) = @_;
    return $self->{lba_opt_path_table_be};
}

sub root_dir {
    my ($self) = @_;
    return $self->{root_dir};
}

sub vol_set_id {
    my ($self) = @_;
    return $self->{vol_set_id};
}

sub publisher_id {
    my ($self) = @_;
    return $self->{publisher_id};
}

sub data_preparer_id {
    my ($self) = @_;
    return $self->{data_preparer_id};
}

sub application_id {
    my ($self) = @_;
    return $self->{application_id};
}

sub copyright_file_id {
    my ($self) = @_;
    return $self->{copyright_file_id};
}

sub abstract_file_id {
    my ($self) = @_;
    return $self->{abstract_file_id};
}

sub bibliographic_file_id {
    my ($self) = @_;
    return $self->{bibliographic_file_id};
}

sub vol_create_datetime {
    my ($self) = @_;
    return $self->{vol_create_datetime};
}

sub vol_mod_datetime {
    my ($self) = @_;
    return $self->{vol_mod_datetime};
}

sub vol_expire_datetime {
    my ($self) = @_;
    return $self->{vol_expire_datetime};
}

sub vol_effective_datetime {
    my ($self) = @_;
    return $self->{vol_effective_datetime};
}

sub file_structure_version {
    my ($self) = @_;
    return $self->{file_structure_version};
}

sub unused4 {
    my ($self) = @_;
    return $self->{unused4};
}

sub application_area {
    my ($self) = @_;
    return $self->{application_area};
}

sub _raw_root_dir {
    my ($self) = @_;
    return $self->{_raw_root_dir};
}

sub _raw_path_table {
    my ($self) = @_;
    return $self->{_raw_path_table};
}

1;
