# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Cramfs;

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

    $self->{super_block} = Cramfs::SuperBlockStruct->new($self->{_io}, $self, $self->{_root});
}

sub page_size {
    my ($self) = @_;
    return $self->{page_size} if ($self->{page_size});
    $self->{page_size} = 4096;
    return $self->{page_size};
}

sub super_block {
    my ($self) = @_;
    return $self->{super_block};
}

########################################################################
package Cramfs::SuperBlockStruct;

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
    $self->{size} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{future} = $self->{_io}->read_u4le();
    $self->{signature} = $self->{_io}->read_bytes(16);
    $self->{fsid} = Cramfs::Info->new($self->{_io}, $self, $self->{_root});
    $self->{name} = Encode::decode("ASCII", $self->{_io}->read_bytes(16));
    $self->{root} = Cramfs::Inode->new($self->{_io}, $self, $self->{_root});
}

sub flag_fsid_v2 {
    my ($self) = @_;
    return $self->{flag_fsid_v2} if ($self->{flag_fsid_v2});
    $self->{flag_fsid_v2} = (($self->flags() >> 0) & 1);
    return $self->{flag_fsid_v2};
}

sub flag_holes {
    my ($self) = @_;
    return $self->{flag_holes} if ($self->{flag_holes});
    $self->{flag_holes} = (($self->flags() >> 8) & 1);
    return $self->{flag_holes};
}

sub flag_wrong_signature {
    my ($self) = @_;
    return $self->{flag_wrong_signature} if ($self->{flag_wrong_signature});
    $self->{flag_wrong_signature} = (($self->flags() >> 9) & 1);
    return $self->{flag_wrong_signature};
}

sub flag_sorted_dirs {
    my ($self) = @_;
    return $self->{flag_sorted_dirs} if ($self->{flag_sorted_dirs});
    $self->{flag_sorted_dirs} = (($self->flags() >> 1) & 1);
    return $self->{flag_sorted_dirs};
}

sub flag_shifted_root_offset {
    my ($self) = @_;
    return $self->{flag_shifted_root_offset} if ($self->{flag_shifted_root_offset});
    $self->{flag_shifted_root_offset} = (($self->flags() >> 10) & 1);
    return $self->{flag_shifted_root_offset};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub future {
    my ($self) = @_;
    return $self->{future};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub fsid {
    my ($self) = @_;
    return $self->{fsid};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub root {
    my ($self) = @_;
    return $self->{root};
}

########################################################################
package Cramfs::ChunkedDataInode;

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

    $self->{block_end_index} = ();
    my $n_block_end_index = int((($self->_parent()->size() + $self->_root()->page_size()) - 1) / $self->_root()->page_size());
    for (my $i = 0; $i < $n_block_end_index; $i++) {
        $self->{block_end_index}[$i] = $self->{_io}->read_u4le();
    }
    $self->{raw_blocks} = $self->{_io}->read_bytes_full();
}

sub block_end_index {
    my ($self) = @_;
    return $self->{block_end_index};
}

sub raw_blocks {
    my ($self) = @_;
    return $self->{raw_blocks};
}

########################################################################
package Cramfs::Inode;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FILE_TYPE_FIFO = 1;
our $FILE_TYPE_CHRDEV = 2;
our $FILE_TYPE_DIR = 4;
our $FILE_TYPE_BLKDEV = 6;
our $FILE_TYPE_REG_FILE = 8;
our $FILE_TYPE_SYMLINK = 10;
our $FILE_TYPE_SOCKET = 12;

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
    $self->{size_gid} = $self->{_io}->read_u4le();
    $self->{namelen_offset} = $self->{_io}->read_u4le();
    $self->{name} = Encode::decode("utf-8", $self->{_io}->read_bytes($self->namelen()));
}

sub attr {
    my ($self) = @_;
    return $self->{attr} if ($self->{attr});
    $self->{attr} = (($self->mode() >> 9) & 7);
    return $self->{attr};
}

sub as_reg_file {
    my ($self) = @_;
    return $self->{as_reg_file} if ($self->{as_reg_file});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->offset());
    $self->{as_reg_file} = Cramfs::ChunkedDataInode->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{as_reg_file};
}

sub perm_u {
    my ($self) = @_;
    return $self->{perm_u} if ($self->{perm_u});
    $self->{perm_u} = (($self->mode() >> 6) & 7);
    return $self->{perm_u};
}

sub as_symlink {
    my ($self) = @_;
    return $self->{as_symlink} if ($self->{as_symlink});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->offset());
    $self->{as_symlink} = Cramfs::ChunkedDataInode->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{as_symlink};
}

sub perm_o {
    my ($self) = @_;
    return $self->{perm_o} if ($self->{perm_o});
    $self->{perm_o} = ($self->mode() & 7);
    return $self->{perm_o};
}

sub size {
    my ($self) = @_;
    return $self->{size} if ($self->{size});
    $self->{size} = ($self->size_gid() & 16777215);
    return $self->{size};
}

sub gid {
    my ($self) = @_;
    return $self->{gid} if ($self->{gid});
    $self->{gid} = ($self->size_gid() >> 24);
    return $self->{gid};
}

sub perm_g {
    my ($self) = @_;
    return $self->{perm_g} if ($self->{perm_g});
    $self->{perm_g} = (($self->mode() >> 3) & 7);
    return $self->{perm_g};
}

sub namelen {
    my ($self) = @_;
    return $self->{namelen} if ($self->{namelen});
    $self->{namelen} = (($self->namelen_offset() & 63) << 2);
    return $self->{namelen};
}

sub as_dir {
    my ($self) = @_;
    return $self->{as_dir} if ($self->{as_dir});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->offset());
    $self->{_raw_as_dir} = $io->read_bytes($self->size());
    my $io__raw_as_dir = IO::KaitaiStruct::Stream->new($self->{_raw_as_dir});
    $self->{as_dir} = Cramfs::DirInode->new($io__raw_as_dir, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{as_dir};
}

sub type {
    my ($self) = @_;
    return $self->{type} if ($self->{type});
    $self->{type} = (($self->mode() >> 12) & 15);
    return $self->{type};
}

sub offset {
    my ($self) = @_;
    return $self->{offset} if ($self->{offset});
    $self->{offset} = ((($self->namelen_offset() >> 6) & 67108863) << 2);
    return $self->{offset};
}

sub mode {
    my ($self) = @_;
    return $self->{mode};
}

sub uid {
    my ($self) = @_;
    return $self->{uid};
}

sub size_gid {
    my ($self) = @_;
    return $self->{size_gid};
}

sub namelen_offset {
    my ($self) = @_;
    return $self->{namelen_offset};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub _raw_as_dir {
    my ($self) = @_;
    return $self->{_raw_as_dir};
}

########################################################################
package Cramfs::DirInode;

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

    if ($self->_io()->size() > 0) {
        $self->{children} = ();
        while (!$self->{_io}->is_eof()) {
            push @{$self->{children}}, Cramfs::Inode->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub children {
    my ($self) = @_;
    return $self->{children};
}

########################################################################
package Cramfs::Info;

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

    $self->{crc} = $self->{_io}->read_u4le();
    $self->{edition} = $self->{_io}->read_u4le();
    $self->{blocks} = $self->{_io}->read_u4le();
    $self->{files} = $self->{_io}->read_u4le();
}

sub crc {
    my ($self) = @_;
    return $self->{crc};
}

sub edition {
    my ($self) = @_;
    return $self->{edition};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

1;
