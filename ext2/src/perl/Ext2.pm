# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Ext2;

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

}

sub bg1 {
    my ($self) = @_;
    return $self->{bg1} if ($self->{bg1});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(1024);
    $self->{bg1} = Ext2::BlockGroup->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{bg1};
}

sub root_dir {
    my ($self) = @_;
    return $self->{root_dir} if ($self->{root_dir});
    $self->{root_dir} = @{@{$self->bg1()->block_groups()}[0]->inodes()}[1]->as_dir();
    return $self->{root_dir};
}

########################################################################
package Ext2::SuperBlockStruct;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $STATE_ENUM_VALID_FS = 1;
our $STATE_ENUM_ERROR_FS = 2;

our $ERRORS_ENUM_ACT_CONTINUE = 1;
our $ERRORS_ENUM_ACT_RO = 2;
our $ERRORS_ENUM_ACT_PANIC = 3;

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

    $self->{inodes_count} = $self->{_io}->read_u4le();
    $self->{blocks_count} = $self->{_io}->read_u4le();
    $self->{r_blocks_count} = $self->{_io}->read_u4le();
    $self->{free_blocks_count} = $self->{_io}->read_u4le();
    $self->{free_inodes_count} = $self->{_io}->read_u4le();
    $self->{first_data_block} = $self->{_io}->read_u4le();
    $self->{log_block_size} = $self->{_io}->read_u4le();
    $self->{log_frag_size} = $self->{_io}->read_u4le();
    $self->{blocks_per_group} = $self->{_io}->read_u4le();
    $self->{frags_per_group} = $self->{_io}->read_u4le();
    $self->{inodes_per_group} = $self->{_io}->read_u4le();
    $self->{mtime} = $self->{_io}->read_u4le();
    $self->{wtime} = $self->{_io}->read_u4le();
    $self->{mnt_count} = $self->{_io}->read_u2le();
    $self->{max_mnt_count} = $self->{_io}->read_u2le();
    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (83, 239)));
    $self->{state} = $self->{_io}->read_u2le();
    $self->{errors} = $self->{_io}->read_u2le();
    $self->{minor_rev_level} = $self->{_io}->read_u2le();
    $self->{lastcheck} = $self->{_io}->read_u4le();
    $self->{checkinterval} = $self->{_io}->read_u4le();
    $self->{creator_os} = $self->{_io}->read_u4le();
    $self->{rev_level} = $self->{_io}->read_u4le();
    $self->{def_resuid} = $self->{_io}->read_u2le();
    $self->{def_resgid} = $self->{_io}->read_u2le();
    $self->{first_ino} = $self->{_io}->read_u4le();
    $self->{inode_size} = $self->{_io}->read_u2le();
    $self->{block_group_nr} = $self->{_io}->read_u2le();
    $self->{feature_compat} = $self->{_io}->read_u4le();
    $self->{feature_incompat} = $self->{_io}->read_u4le();
    $self->{feature_ro_compat} = $self->{_io}->read_u4le();
    $self->{uuid} = $self->{_io}->read_bytes(16);
    $self->{volume_name} = $self->{_io}->read_bytes(16);
    $self->{last_mounted} = $self->{_io}->read_bytes(64);
    $self->{algo_bitmap} = $self->{_io}->read_u4le();
    $self->{prealloc_blocks} = $self->{_io}->read_u1();
    $self->{prealloc_dir_blocks} = $self->{_io}->read_u1();
    $self->{padding1} = $self->{_io}->read_bytes(2);
    $self->{journal_uuid} = $self->{_io}->read_bytes(16);
    $self->{journal_inum} = $self->{_io}->read_u4le();
    $self->{journal_dev} = $self->{_io}->read_u4le();
    $self->{last_orphan} = $self->{_io}->read_u4le();
    $self->{hash_seed} = ();
    my $n_hash_seed = 4;
    for (my $i = 0; $i < $n_hash_seed; $i++) {
        $self->{hash_seed}[$i] = $self->{_io}->read_u4le();
    }
    $self->{def_hash_version} = $self->{_io}->read_u1();
}

sub block_size {
    my ($self) = @_;
    return $self->{block_size} if ($self->{block_size});
    $self->{block_size} = (1024 << $self->log_block_size());
    return $self->{block_size};
}

sub block_group_count {
    my ($self) = @_;
    return $self->{block_group_count} if ($self->{block_group_count});
    $self->{block_group_count} = int($self->blocks_count() / $self->blocks_per_group());
    return $self->{block_group_count};
}

sub inodes_count {
    my ($self) = @_;
    return $self->{inodes_count};
}

sub blocks_count {
    my ($self) = @_;
    return $self->{blocks_count};
}

sub r_blocks_count {
    my ($self) = @_;
    return $self->{r_blocks_count};
}

sub free_blocks_count {
    my ($self) = @_;
    return $self->{free_blocks_count};
}

sub free_inodes_count {
    my ($self) = @_;
    return $self->{free_inodes_count};
}

sub first_data_block {
    my ($self) = @_;
    return $self->{first_data_block};
}

sub log_block_size {
    my ($self) = @_;
    return $self->{log_block_size};
}

sub log_frag_size {
    my ($self) = @_;
    return $self->{log_frag_size};
}

sub blocks_per_group {
    my ($self) = @_;
    return $self->{blocks_per_group};
}

sub frags_per_group {
    my ($self) = @_;
    return $self->{frags_per_group};
}

sub inodes_per_group {
    my ($self) = @_;
    return $self->{inodes_per_group};
}

sub mtime {
    my ($self) = @_;
    return $self->{mtime};
}

sub wtime {
    my ($self) = @_;
    return $self->{wtime};
}

sub mnt_count {
    my ($self) = @_;
    return $self->{mnt_count};
}

sub max_mnt_count {
    my ($self) = @_;
    return $self->{max_mnt_count};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub state {
    my ($self) = @_;
    return $self->{state};
}

sub errors {
    my ($self) = @_;
    return $self->{errors};
}

sub minor_rev_level {
    my ($self) = @_;
    return $self->{minor_rev_level};
}

sub lastcheck {
    my ($self) = @_;
    return $self->{lastcheck};
}

sub checkinterval {
    my ($self) = @_;
    return $self->{checkinterval};
}

sub creator_os {
    my ($self) = @_;
    return $self->{creator_os};
}

sub rev_level {
    my ($self) = @_;
    return $self->{rev_level};
}

sub def_resuid {
    my ($self) = @_;
    return $self->{def_resuid};
}

sub def_resgid {
    my ($self) = @_;
    return $self->{def_resgid};
}

sub first_ino {
    my ($self) = @_;
    return $self->{first_ino};
}

sub inode_size {
    my ($self) = @_;
    return $self->{inode_size};
}

sub block_group_nr {
    my ($self) = @_;
    return $self->{block_group_nr};
}

sub feature_compat {
    my ($self) = @_;
    return $self->{feature_compat};
}

sub feature_incompat {
    my ($self) = @_;
    return $self->{feature_incompat};
}

sub feature_ro_compat {
    my ($self) = @_;
    return $self->{feature_ro_compat};
}

sub uuid {
    my ($self) = @_;
    return $self->{uuid};
}

sub volume_name {
    my ($self) = @_;
    return $self->{volume_name};
}

sub last_mounted {
    my ($self) = @_;
    return $self->{last_mounted};
}

sub algo_bitmap {
    my ($self) = @_;
    return $self->{algo_bitmap};
}

sub prealloc_blocks {
    my ($self) = @_;
    return $self->{prealloc_blocks};
}

sub prealloc_dir_blocks {
    my ($self) = @_;
    return $self->{prealloc_dir_blocks};
}

sub padding1 {
    my ($self) = @_;
    return $self->{padding1};
}

sub journal_uuid {
    my ($self) = @_;
    return $self->{journal_uuid};
}

sub journal_inum {
    my ($self) = @_;
    return $self->{journal_inum};
}

sub journal_dev {
    my ($self) = @_;
    return $self->{journal_dev};
}

sub last_orphan {
    my ($self) = @_;
    return $self->{last_orphan};
}

sub hash_seed {
    my ($self) = @_;
    return $self->{hash_seed};
}

sub def_hash_version {
    my ($self) = @_;
    return $self->{def_hash_version};
}

########################################################################
package Ext2::DirEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FILE_TYPE_ENUM_UNKNOWN = 0;
our $FILE_TYPE_ENUM_REG_FILE = 1;
our $FILE_TYPE_ENUM_DIR = 2;
our $FILE_TYPE_ENUM_CHRDEV = 3;
our $FILE_TYPE_ENUM_BLKDEV = 4;
our $FILE_TYPE_ENUM_FIFO = 5;
our $FILE_TYPE_ENUM_SOCK = 6;
our $FILE_TYPE_ENUM_SYMLINK = 7;

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

    $self->{inode_ptr} = $self->{_io}->read_u4le();
    $self->{rec_len} = $self->{_io}->read_u2le();
    $self->{name_len} = $self->{_io}->read_u1();
    $self->{file_type} = $self->{_io}->read_u1();
    $self->{name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->name_len()));
    $self->{padding} = $self->{_io}->read_bytes((($self->rec_len() - $self->name_len()) - 8));
}

sub inode {
    my ($self) = @_;
    return $self->{inode} if ($self->{inode});
    $self->{inode} = @{@{$self->_root()->bg1()->block_groups()}[int(($self->inode_ptr() - 1) / $self->_root()->bg1()->super_block()->inodes_per_group())]->inodes()}[(($self->inode_ptr() - 1) % $self->_root()->bg1()->super_block()->inodes_per_group())];
    return $self->{inode};
}

sub inode_ptr {
    my ($self) = @_;
    return $self->{inode_ptr};
}

sub rec_len {
    my ($self) = @_;
    return $self->{rec_len};
}

sub name_len {
    my ($self) = @_;
    return $self->{name_len};
}

sub file_type {
    my ($self) = @_;
    return $self->{file_type};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Ext2::Inode;

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

    $self->{mode} = $self->{_io}->read_u2le();
    $self->{uid} = $self->{_io}->read_u2le();
    $self->{size} = $self->{_io}->read_u4le();
    $self->{atime} = $self->{_io}->read_u4le();
    $self->{ctime} = $self->{_io}->read_u4le();
    $self->{mtime} = $self->{_io}->read_u4le();
    $self->{dtime} = $self->{_io}->read_u4le();
    $self->{gid} = $self->{_io}->read_u2le();
    $self->{links_count} = $self->{_io}->read_u2le();
    $self->{blocks} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{osd1} = $self->{_io}->read_u4le();
    $self->{block} = ();
    my $n_block = 15;
    for (my $i = 0; $i < $n_block; $i++) {
        $self->{block}[$i] = Ext2::BlockPtr->new($self->{_io}, $self, $self->{_root});
    }
    $self->{generation} = $self->{_io}->read_u4le();
    $self->{file_acl} = $self->{_io}->read_u4le();
    $self->{dir_acl} = $self->{_io}->read_u4le();
    $self->{faddr} = $self->{_io}->read_u4le();
    $self->{osd2} = $self->{_io}->read_bytes(12);
}

sub as_dir {
    my ($self) = @_;
    return $self->{as_dir} if ($self->{as_dir});
    my $io = @{$self->block()}[0]->body()->_io();
    my $_pos = $io->pos();
    $io->seek(0);
    $self->{as_dir} = Ext2::Dir->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{as_dir};
}

sub mode {
    my ($self) = @_;
    return $self->{mode};
}

sub uid {
    my ($self) = @_;
    return $self->{uid};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub atime {
    my ($self) = @_;
    return $self->{atime};
}

sub ctime {
    my ($self) = @_;
    return $self->{ctime};
}

sub mtime {
    my ($self) = @_;
    return $self->{mtime};
}

sub dtime {
    my ($self) = @_;
    return $self->{dtime};
}

sub gid {
    my ($self) = @_;
    return $self->{gid};
}

sub links_count {
    my ($self) = @_;
    return $self->{links_count};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub osd1 {
    my ($self) = @_;
    return $self->{osd1};
}

sub block {
    my ($self) = @_;
    return $self->{block};
}

sub generation {
    my ($self) = @_;
    return $self->{generation};
}

sub file_acl {
    my ($self) = @_;
    return $self->{file_acl};
}

sub dir_acl {
    my ($self) = @_;
    return $self->{dir_acl};
}

sub faddr {
    my ($self) = @_;
    return $self->{faddr};
}

sub osd2 {
    my ($self) = @_;
    return $self->{osd2};
}

########################################################################
package Ext2::BlockPtr;

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

    $self->{ptr} = $self->{_io}->read_u4le();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->ptr() * $self->_root()->bg1()->super_block()->block_size()));
    $self->{_raw_body} = $self->{_io}->read_bytes($self->_root()->bg1()->super_block()->block_size());
    my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
    $self->{body} = Ext2::RawBlock->new($io__raw_body, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub ptr {
    my ($self) = @_;
    return $self->{ptr};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Ext2::Dir;

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

    $self->{entries} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Ext2::DirEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Ext2::BlockGroup;

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

    $self->{_raw_super_block} = $self->{_io}->read_bytes(1024);
    my $io__raw_super_block = IO::KaitaiStruct::Stream->new($self->{_raw_super_block});
    $self->{super_block} = Ext2::SuperBlockStruct->new($io__raw_super_block, $self, $self->{_root});
    $self->{block_groups} = ();
    my $n_block_groups = $self->super_block()->block_group_count();
    for (my $i = 0; $i < $n_block_groups; $i++) {
        $self->{block_groups}[$i] = Ext2::Bgd->new($self->{_io}, $self, $self->{_root});
    }
}

sub super_block {
    my ($self) = @_;
    return $self->{super_block};
}

sub block_groups {
    my ($self) = @_;
    return $self->{block_groups};
}

sub _raw_super_block {
    my ($self) = @_;
    return $self->{_raw_super_block};
}

########################################################################
package Ext2::Bgd;

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

    $self->{block_bitmap_block} = $self->{_io}->read_u4le();
    $self->{inode_bitmap_block} = $self->{_io}->read_u4le();
    $self->{inode_table_block} = $self->{_io}->read_u4le();
    $self->{free_blocks_count} = $self->{_io}->read_u2le();
    $self->{free_inodes_count} = $self->{_io}->read_u2le();
    $self->{used_dirs_count} = $self->{_io}->read_u2le();
    $self->{pad_reserved} = $self->{_io}->read_bytes((2 + 12));
}

sub block_bitmap {
    my ($self) = @_;
    return $self->{block_bitmap} if ($self->{block_bitmap});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->block_bitmap_block() * $self->_root()->bg1()->super_block()->block_size()));
    $self->{block_bitmap} = $self->{_io}->read_bytes(1024);
    $self->{_io}->seek($_pos);
    return $self->{block_bitmap};
}

sub inode_bitmap {
    my ($self) = @_;
    return $self->{inode_bitmap} if ($self->{inode_bitmap});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->inode_bitmap_block() * $self->_root()->bg1()->super_block()->block_size()));
    $self->{inode_bitmap} = $self->{_io}->read_bytes(1024);
    $self->{_io}->seek($_pos);
    return $self->{inode_bitmap};
}

sub inodes {
    my ($self) = @_;
    return $self->{inodes} if ($self->{inodes});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->inode_table_block() * $self->_root()->bg1()->super_block()->block_size()));
    $self->{inodes} = ();
    my $n_inodes = $self->_root()->bg1()->super_block()->inodes_per_group();
    for (my $i = 0; $i < $n_inodes; $i++) {
        $self->{inodes}[$i] = Ext2::Inode->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{inodes};
}

sub block_bitmap_block {
    my ($self) = @_;
    return $self->{block_bitmap_block};
}

sub inode_bitmap_block {
    my ($self) = @_;
    return $self->{inode_bitmap_block};
}

sub inode_table_block {
    my ($self) = @_;
    return $self->{inode_table_block};
}

sub free_blocks_count {
    my ($self) = @_;
    return $self->{free_blocks_count};
}

sub free_inodes_count {
    my ($self) = @_;
    return $self->{free_inodes_count};
}

sub used_dirs_count {
    my ($self) = @_;
    return $self->{used_dirs_count};
}

sub pad_reserved {
    my ($self) = @_;
    return $self->{pad_reserved};
}

########################################################################
package Ext2::RawBlock;

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

    $self->{body} = $self->{_io}->read_bytes($self->_root()->bg1()->super_block()->block_size());
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;
