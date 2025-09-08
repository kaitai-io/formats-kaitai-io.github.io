# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use DosDatetime;
use Encode;

########################################################################
package Vfat;

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

    $self->{boot_sector} = Vfat::BootSector->new($self->{_io}, $self, $self->{_root});
}

sub fats {
    my ($self) = @_;
    return $self->{fats} if ($self->{fats});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->boot_sector()->pos_fats());
    $self->{fats} = [];
    my $n_fats = $self->boot_sector()->bpb()->num_fats();
    for (my $i = 0; $i < $n_fats; $i++) {
        push @{$self->{fats}}, $self->{_io}->read_bytes($self->boot_sector()->size_fat());
    }
    $self->{_io}->seek($_pos);
    return $self->{fats};
}

sub root_dir {
    my ($self) = @_;
    return $self->{root_dir} if ($self->{root_dir});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->boot_sector()->pos_root_dir());
    $self->{_raw_root_dir} = $self->{_io}->read_bytes($self->boot_sector()->size_root_dir());
    my $io__raw_root_dir = IO::KaitaiStruct::Stream->new($self->{_raw_root_dir});
    $self->{root_dir} = Vfat::RootDirectory->new($io__raw_root_dir, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{root_dir};
}

sub boot_sector {
    my ($self) = @_;
    return $self->{boot_sector};
}

sub _raw_root_dir {
    my ($self) = @_;
    return $self->{_raw_root_dir};
}

########################################################################
package Vfat::BiosParamBlock;

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

    $self->{bytes_per_ls} = $self->{_io}->read_u2le();
    $self->{ls_per_clus} = $self->{_io}->read_u1();
    $self->{num_reserved_ls} = $self->{_io}->read_u2le();
    $self->{num_fats} = $self->{_io}->read_u1();
    $self->{max_root_dir_rec} = $self->{_io}->read_u2le();
    $self->{total_ls_2} = $self->{_io}->read_u2le();
    $self->{media_code} = $self->{_io}->read_u1();
    $self->{ls_per_fat} = $self->{_io}->read_u2le();
    $self->{ps_per_track} = $self->{_io}->read_u2le();
    $self->{num_heads} = $self->{_io}->read_u2le();
    $self->{num_hidden_sectors} = $self->{_io}->read_u4le();
    $self->{total_ls_4} = $self->{_io}->read_u4le();
}

sub bytes_per_ls {
    my ($self) = @_;
    return $self->{bytes_per_ls};
}

sub ls_per_clus {
    my ($self) = @_;
    return $self->{ls_per_clus};
}

sub num_reserved_ls {
    my ($self) = @_;
    return $self->{num_reserved_ls};
}

sub num_fats {
    my ($self) = @_;
    return $self->{num_fats};
}

sub max_root_dir_rec {
    my ($self) = @_;
    return $self->{max_root_dir_rec};
}

sub total_ls_2 {
    my ($self) = @_;
    return $self->{total_ls_2};
}

sub media_code {
    my ($self) = @_;
    return $self->{media_code};
}

sub ls_per_fat {
    my ($self) = @_;
    return $self->{ls_per_fat};
}

sub ps_per_track {
    my ($self) = @_;
    return $self->{ps_per_track};
}

sub num_heads {
    my ($self) = @_;
    return $self->{num_heads};
}

sub num_hidden_sectors {
    my ($self) = @_;
    return $self->{num_hidden_sectors};
}

sub total_ls_4 {
    my ($self) = @_;
    return $self->{total_ls_4};
}

########################################################################
package Vfat::BootSector;

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

    $self->{jmp_instruction} = $self->{_io}->read_bytes(3);
    $self->{oem_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(8), 32));
    $self->{bpb} = Vfat::BiosParamBlock->new($self->{_io}, $self, $self->{_root});
    if (!($self->is_fat32())) {
        $self->{ebpb_fat16} = Vfat::ExtBiosParamBlockFat16->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->is_fat32()) {
        $self->{ebpb_fat32} = Vfat::ExtBiosParamBlockFat32->new($self->{_io}, $self, $self->{_root});
    }
}

sub is_fat32 {
    my ($self) = @_;
    return $self->{is_fat32} if ($self->{is_fat32});
    $self->{is_fat32} = $self->bpb()->max_root_dir_rec() == 0;
    return $self->{is_fat32};
}

sub ls_per_fat {
    my ($self) = @_;
    return $self->{ls_per_fat} if ($self->{ls_per_fat});
    $self->{ls_per_fat} = ($self->is_fat32() ? $self->ebpb_fat32()->ls_per_fat() : $self->bpb()->ls_per_fat());
    return $self->{ls_per_fat};
}

sub ls_per_root_dir {
    my ($self) = @_;
    return $self->{ls_per_root_dir} if ($self->{ls_per_root_dir});
    $self->{ls_per_root_dir} = int((($self->bpb()->max_root_dir_rec() * 32 + $self->bpb()->bytes_per_ls()) - 1) / $self->bpb()->bytes_per_ls());
    return $self->{ls_per_root_dir};
}

sub pos_fats {
    my ($self) = @_;
    return $self->{pos_fats} if ($self->{pos_fats});
    $self->{pos_fats} = $self->bpb()->bytes_per_ls() * $self->bpb()->num_reserved_ls();
    return $self->{pos_fats};
}

sub pos_root_dir {
    my ($self) = @_;
    return $self->{pos_root_dir} if ($self->{pos_root_dir});
    $self->{pos_root_dir} = $self->bpb()->bytes_per_ls() * ($self->bpb()->num_reserved_ls() + $self->ls_per_fat() * $self->bpb()->num_fats());
    return $self->{pos_root_dir};
}

sub size_fat {
    my ($self) = @_;
    return $self->{size_fat} if ($self->{size_fat});
    $self->{size_fat} = $self->bpb()->bytes_per_ls() * $self->ls_per_fat();
    return $self->{size_fat};
}

sub size_root_dir {
    my ($self) = @_;
    return $self->{size_root_dir} if ($self->{size_root_dir});
    $self->{size_root_dir} = $self->ls_per_root_dir() * $self->bpb()->bytes_per_ls();
    return $self->{size_root_dir};
}

sub jmp_instruction {
    my ($self) = @_;
    return $self->{jmp_instruction};
}

sub oem_name {
    my ($self) = @_;
    return $self->{oem_name};
}

sub bpb {
    my ($self) = @_;
    return $self->{bpb};
}

sub ebpb_fat16 {
    my ($self) = @_;
    return $self->{ebpb_fat16};
}

sub ebpb_fat32 {
    my ($self) = @_;
    return $self->{ebpb_fat32};
}

########################################################################
package Vfat::ExtBiosParamBlockFat16;

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

    $self->{phys_drive_num} = $self->{_io}->read_u1();
    $self->{reserved1} = $self->{_io}->read_u1();
    $self->{ext_boot_sign} = $self->{_io}->read_u1();
    $self->{volume_id} = $self->{_io}->read_bytes(4);
    $self->{partition_volume_label} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(11), 32));
    $self->{fs_type_str} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(8), 32));
}

sub phys_drive_num {
    my ($self) = @_;
    return $self->{phys_drive_num};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub ext_boot_sign {
    my ($self) = @_;
    return $self->{ext_boot_sign};
}

sub volume_id {
    my ($self) = @_;
    return $self->{volume_id};
}

sub partition_volume_label {
    my ($self) = @_;
    return $self->{partition_volume_label};
}

sub fs_type_str {
    my ($self) = @_;
    return $self->{fs_type_str};
}

########################################################################
package Vfat::ExtBiosParamBlockFat32;

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

    $self->{ls_per_fat} = $self->{_io}->read_u4le();
    $self->{has_active_fat} = $self->{_io}->read_bits_int_le(1);
    $self->{reserved1} = $self->{_io}->read_bits_int_le(3);
    $self->{active_fat_id} = $self->{_io}->read_bits_int_le(4);
    $self->{_io}->align_to_byte();
    $self->{reserved2} = $self->{_io}->read_bytes(1);
    $self->{fat_version} = $self->{_io}->read_u2le();
    $self->{root_dir_start_clus} = $self->{_io}->read_u4le();
    $self->{ls_fs_info} = $self->{_io}->read_u2le();
    $self->{boot_sectors_copy_start_ls} = $self->{_io}->read_u2le();
    $self->{reserved3} = $self->{_io}->read_bytes(12);
    $self->{phys_drive_num} = $self->{_io}->read_u1();
    $self->{reserved4} = $self->{_io}->read_u1();
    $self->{ext_boot_sign} = $self->{_io}->read_u1();
    $self->{volume_id} = $self->{_io}->read_bytes(4);
    $self->{partition_volume_label} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(11), 32));
    $self->{fs_type_str} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(8), 32));
}

sub ls_per_fat {
    my ($self) = @_;
    return $self->{ls_per_fat};
}

sub has_active_fat {
    my ($self) = @_;
    return $self->{has_active_fat};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub active_fat_id {
    my ($self) = @_;
    return $self->{active_fat_id};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub fat_version {
    my ($self) = @_;
    return $self->{fat_version};
}

sub root_dir_start_clus {
    my ($self) = @_;
    return $self->{root_dir_start_clus};
}

sub ls_fs_info {
    my ($self) = @_;
    return $self->{ls_fs_info};
}

sub boot_sectors_copy_start_ls {
    my ($self) = @_;
    return $self->{boot_sectors_copy_start_ls};
}

sub reserved3 {
    my ($self) = @_;
    return $self->{reserved3};
}

sub phys_drive_num {
    my ($self) = @_;
    return $self->{phys_drive_num};
}

sub reserved4 {
    my ($self) = @_;
    return $self->{reserved4};
}

sub ext_boot_sign {
    my ($self) = @_;
    return $self->{ext_boot_sign};
}

sub volume_id {
    my ($self) = @_;
    return $self->{volume_id};
}

sub partition_volume_label {
    my ($self) = @_;
    return $self->{partition_volume_label};
}

sub fs_type_str {
    my ($self) = @_;
    return $self->{fs_type_str};
}

########################################################################
package Vfat::RootDirectory;

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

    $self->{records} = [];
    my $n_records = $self->_root()->boot_sector()->bpb()->max_root_dir_rec();
    for (my $i = 0; $i < $n_records; $i++) {
        push @{$self->{records}}, Vfat::RootDirectoryRec->new($self->{_io}, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package Vfat::RootDirectoryRec;

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

    $self->{file_name} = $self->{_io}->read_bytes(11);
    $self->{_raw_attrs} = $self->{_io}->read_bytes(1);
    my $io__raw_attrs = IO::KaitaiStruct::Stream->new($self->{_raw_attrs});
    $self->{attrs} = Vfat::RootDirectoryRec::AttrFlags->new($io__raw_attrs, $self, $self->{_root});
    $self->{reserved} = $self->{_io}->read_bytes(10);
    $self->{_raw_last_write_time} = $self->{_io}->read_bytes(4);
    my $io__raw_last_write_time = IO::KaitaiStruct::Stream->new($self->{_raw_last_write_time});
    $self->{last_write_time} = DosDatetime->new($io__raw_last_write_time);
    $self->{start_clus} = $self->{_io}->read_u2le();
    $self->{file_size} = $self->{_io}->read_u4le();
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

sub attrs {
    my ($self) = @_;
    return $self->{attrs};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub last_write_time {
    my ($self) = @_;
    return $self->{last_write_time};
}

sub start_clus {
    my ($self) = @_;
    return $self->{start_clus};
}

sub file_size {
    my ($self) = @_;
    return $self->{file_size};
}

sub _raw_attrs {
    my ($self) = @_;
    return $self->{_raw_attrs};
}

sub _raw_last_write_time {
    my ($self) = @_;
    return $self->{_raw_last_write_time};
}

########################################################################
package Vfat::RootDirectoryRec::AttrFlags;

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

    $self->{read_only} = $self->{_io}->read_bits_int_le(1);
    $self->{hidden} = $self->{_io}->read_bits_int_le(1);
    $self->{system} = $self->{_io}->read_bits_int_le(1);
    $self->{volume_id} = $self->{_io}->read_bits_int_le(1);
    $self->{is_directory} = $self->{_io}->read_bits_int_le(1);
    $self->{archive} = $self->{_io}->read_bits_int_le(1);
    $self->{reserved} = $self->{_io}->read_bits_int_le(2);
}

sub long_name {
    my ($self) = @_;
    return $self->{long_name} if ($self->{long_name});
    $self->{long_name} =  (($self->read_only()) && ($self->hidden()) && ($self->system()) && ($self->volume_id())) ;
    return $self->{long_name};
}

sub read_only {
    my ($self) = @_;
    return $self->{read_only};
}

sub hidden {
    my ($self) = @_;
    return $self->{hidden};
}

sub system {
    my ($self) = @_;
    return $self->{system};
}

sub volume_id {
    my ($self) = @_;
    return $self->{volume_id};
}

sub is_directory {
    my ($self) = @_;
    return $self->{is_directory};
}

sub archive {
    my ($self) = @_;
    return $self->{archive};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

1;
