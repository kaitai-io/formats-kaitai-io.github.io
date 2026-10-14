# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package Ubifs;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSION_NO_COMPRESSION = 0;
our $COMPRESSION_LZO = 1;
our $COMPRESSION_ZLIB = 2;
our $COMPRESSION_ZSTD = 3;

our $HASH_ALGOS_MD4 = 0;
our $HASH_ALGOS_MD5 = 1;
our $HASH_ALGOS_SHA1 = 2;
our $HASH_ALGOS_RIPE_MD_160 = 3;
our $HASH_ALGOS_SHA256 = 4;
our $HASH_ALGOS_SHA384 = 5;
our $HASH_ALGOS_SHA512 = 6;
our $HASH_ALGOS_SHA224 = 7;
our $HASH_ALGOS_RIPE_MD_128 = 8;
our $HASH_ALGOS_RIPE_MD_256 = 9;
our $HASH_ALGOS_RIPE_MD_320 = 10;
our $HASH_ALGOS_WP_256 = 11;
our $HASH_ALGOS_WP_384 = 12;
our $HASH_ALGOS_WP_512 = 13;
our $HASH_ALGOS_TGR_128 = 14;
our $HASH_ALGOS_TGR_160 = 15;
our $HASH_ALGOS_TGR_192 = 16;
our $HASH_ALGOS_SM3_256 = 17;
our $HASH_ALGOS_STREEBOG_256 = 18;
our $HASH_ALGOS_STREEBOG_512 = 19;
our $HASH_ALGOS_SHA3_256 = 20;
our $HASH_ALGOS_SHA3_384 = 21;
our $HASH_ALGOS_SHA3_512 = 22;

our $HASHES_R5 = 0;
our $HASHES_TEST_HASH = 1;

our $INODE_TYPES_REGULAR = 0;
our $INODE_TYPES_DIRECTORY = 1;
our $INODE_TYPES_LINK = 2;
our $INODE_TYPES_BLOCK_DEVICE = 3;
our $INODE_TYPES_CHARACTER_DEVICE = 4;
our $INODE_TYPES_FIFO = 5;
our $INODE_TYPES_SOCKET = 6;

our $KEY_FORMATS_SIMPLE = 0;

our $KEY_TYPES_INODE = 0;
our $KEY_TYPES_DATA = 1;
our $KEY_TYPES_DIRECTORY = 2;
our $KEY_TYPES_EXTENDED_ATTRIBUTE = 3;

our $NODE_GROUP_TYPES_NO_NODE_GROUP = 0;
our $NODE_GROUP_TYPES_IN_NODE_GROUP = 1;
our $NODE_GROUP_TYPES_LAST_OF_NODE_GROUP = 2;

our $NODE_TYPES_INODE = 0;
our $NODE_TYPES_DATA = 1;
our $NODE_TYPES_DIRECTORY = 2;
our $NODE_TYPES_EXTENDED_ATTRIBUTE = 3;
our $NODE_TYPES_TRUNCATION = 4;
our $NODE_TYPES_PADDING = 5;
our $NODE_TYPES_SUPERBLOCK = 6;
our $NODE_TYPES_MASTER = 7;
our $NODE_TYPES_REFERENCE = 8;
our $NODE_TYPES_INDEX = 9;
our $NODE_TYPES_COMMIT_START = 10;
our $NODE_TYPES_ORPHAN = 11;
our $NODE_TYPES_AUTHENTICATION = 12;
our $NODE_TYPES_SIGNATURE = 13;

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

sub index {
    my ($self) = @_;
    return $self->{index} if ($self->{index});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->superblock()->node_header()->leb_size() * $self->master_1()->node_header()->leb_root());
    $self->{_raw_index} = $self->{_io}->read_bytes($self->superblock()->node_header()->leb_size());
    my $io__raw_index = IO::KaitaiStruct::Stream->new($self->{_raw_index});
    $self->{index} = Ubifs::Dummy->new($io__raw_index, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{index};
}

sub index_root {
    my ($self) = @_;
    return $self->{index_root} if ($self->{index_root});
    my $io = $self->index()->_io();
    my $_pos = $io->pos();
    $io->seek($self->master_1()->node_header()->ofs_root());
    $self->{index_root} = Ubifs::IndexBlock->new($io, $self, $self->{_root});
    {
        my $_it = $self->{index_root};
    }
    $io->seek($_pos);
    return $self->{index_root};
}

sub lebs {
    my ($self) = @_;
    return $self->{lebs} if ($self->{lebs});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{lebs} = [];
    my $n_lebs = $self->superblock()->node_header()->num_lebs();
    for (my $i = 0; $i < $n_lebs; $i++) {
        push @{$self->{lebs}}, $self->{_io}->read_bytes($self->superblock()->node_header()->leb_size());
    }
    $self->{_io}->seek($_pos);
    return $self->{lebs};
}

sub len_image {
    my ($self) = @_;
    return $self->{len_image} if ($self->{len_image});
    $self->{len_image} = $self->superblock()->node_header()->leb_size() * $self->superblock()->node_header()->num_lebs();
    return $self->{len_image};
}

sub master_1 {
    my ($self) = @_;
    return $self->{master_1} if ($self->{master_1});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->superblock()->node_header()->leb_size());
    $self->{_raw_master_1} = $self->{_io}->read_bytes($self->superblock()->node_header()->leb_size());
    my $io__raw_master_1 = IO::KaitaiStruct::Stream->new($self->{_raw_master_1});
    $self->{master_1} = Ubifs::MasterblockNode->new($io__raw_master_1, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{master_1};
}

sub master_2 {
    my ($self) = @_;
    return $self->{master_2} if ($self->{master_2});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->superblock()->node_header()->leb_size() * 2);
    $self->{_raw_master_2} = $self->{_io}->read_bytes($self->superblock()->node_header()->leb_size());
    my $io__raw_master_2 = IO::KaitaiStruct::Stream->new($self->{_raw_master_2});
    $self->{master_2} = Ubifs::MasterblockNode->new($io__raw_master_2, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{master_2};
}

sub superblock {
    my ($self) = @_;
    return $self->{superblock} if ($self->{superblock});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{superblock} = Ubifs::SuperblockNode->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{superblock};
}

sub _raw_index {
    my ($self) = @_;
    return $self->{_raw_index};
}

sub _raw_master_1 {
    my ($self) = @_;
    return $self->{_raw_master_1};
}

sub _raw_master_2 {
    my ($self) = @_;
    return $self->{_raw_master_2};
}

########################################################################
package Ubifs::AuthenticationHeader;

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

    $self->{hmac} = $self->{_io}->read_bytes($self->_root()->superblock()->node_header()->len_hash());
}

sub hmac {
    my ($self) = @_;
    return $self->{hmac};
}

########################################################################
package Ubifs::Block;

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

    $self->{header} = Ubifs::CommonHeader->new($self->{_io}, $self, $self->{_root});
    my $_on = $self->header()->node_type();
    if ($_on == $Ubifs::NODE_TYPES_AUTHENTICATION) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::AuthenticationHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_COMMIT_START) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::CommitStartHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_DATA) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::DataHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_DIRECTORY) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::DirectoryHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_EXTENDED_ATTRIBUTE) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::DirectoryHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_INDEX) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::IndexHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_INODE) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::InodeHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_MASTER) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::MasterHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_ORPHAN) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::OrphanHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_PADDING) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::PaddingHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_REFERENCE) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::ReferenceHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_SIGNATURE) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::SignatureHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_SUPERBLOCK) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::SuperblockHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    elsif ($_on == $Ubifs::NODE_TYPES_TRUNCATION) {
        $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
        my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
        $self->{node_header} = Ubifs::TruncationHeader->new($io__raw_node_header, $self, $self->{_root});
    }
    else {
        $self->{node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub node_header {
    my ($self) = @_;
    return $self->{node_header};
}

sub _raw_node_header {
    my ($self) = @_;
    return $self->{_raw_node_header};
}

########################################################################
package Ubifs::Branch;

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

    $self->{target_leb} = $self->{_io}->read_u4le();
    $self->{ofs_target} = $self->{_io}->read_u4le();
    $self->{len_target} = $self->{_io}->read_u4le();
    $self->{_raw_key} = $self->{_io}->read_bytes(8);
    my $io__raw_key = IO::KaitaiStruct::Stream->new($self->{_raw_key});
    $self->{key} = Ubifs::Key->new($io__raw_key, $self, $self->{_root});
    $self->{hash} = $self->{_io}->read_bytes($self->_root()->superblock()->node_header()->len_hash());
}

sub target {
    my ($self) = @_;
    return $self->{target} if ($self->{target});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->_root()->superblock()->node_header()->leb_size() * $self->target_leb() + $self->ofs_target());
    $self->{_raw_target} = $io->read_bytes($self->len_target());
    my $io__raw_target = IO::KaitaiStruct::Stream->new($self->{_raw_target});
    $self->{target} = Ubifs::Block->new($io__raw_target, $self, $self->{_root});
    {
        my $_it = $self->{target};
    }
    $io->seek($_pos);
    return $self->{target};
}

sub target_leb {
    my ($self) = @_;
    return $self->{target_leb};
}

sub ofs_target {
    my ($self) = @_;
    return $self->{ofs_target};
}

sub len_target {
    my ($self) = @_;
    return $self->{len_target};
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub hash {
    my ($self) = @_;
    return $self->{hash};
}

sub _raw_key {
    my ($self) = @_;
    return $self->{_raw_key};
}

sub _raw_target {
    my ($self) = @_;
    return $self->{_raw_target};
}

########################################################################
package Ubifs::CommitStartHeader;

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

    $self->{commit_number} = $self->{_io}->read_u8le();
}

sub commit_number {
    my ($self) = @_;
    return $self->{commit_number};
}

########################################################################
package Ubifs::CommonHeader;

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

    $self->{magic} = $self->{_io}->read_u4le();
    $self->{crc} = $self->{_io}->read_u4le();
    $self->{sequence_number} = $self->{_io}->read_u8le();
    $self->{len_full_node} = $self->{_io}->read_u4le();
    $self->{node_type} = $self->{_io}->read_u1();
    $self->{group_type} = $self->{_io}->read_u1();
    $self->{padding} = $self->{_io}->read_bytes(2);
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub crc {
    my ($self) = @_;
    return $self->{crc};
}

sub sequence_number {
    my ($self) = @_;
    return $self->{sequence_number};
}

sub len_full_node {
    my ($self) = @_;
    return $self->{len_full_node};
}

sub node_type {
    my ($self) = @_;
    return $self->{node_type};
}

sub group_type {
    my ($self) = @_;
    return $self->{group_type};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Ubifs::DataHeader;

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

    $self->{_raw_key} = $self->{_io}->read_bytes(16);
    my $io__raw_key = IO::KaitaiStruct::Stream->new($self->{_raw_key});
    $self->{key} = Ubifs::Key->new($io__raw_key, $self, $self->{_root});
    $self->{len_uncompressed} = $self->{_io}->read_u4le();
    $self->{compression} = $self->{_io}->read_u2le();
    $self->{len_compressed_data} = $self->{_io}->read_u2le();
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub len_uncompressed {
    my ($self) = @_;
    return $self->{len_uncompressed};
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub len_compressed_data {
    my ($self) = @_;
    return $self->{len_compressed_data};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub _raw_key {
    my ($self) = @_;
    return $self->{_raw_key};
}

########################################################################
package Ubifs::DirectoryHeader;

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

    $self->{_raw_key} = $self->{_io}->read_bytes(16);
    my $io__raw_key = IO::KaitaiStruct::Stream->new($self->{_raw_key});
    $self->{key} = Ubifs::Key->new($io__raw_key, $self, $self->{_root});
    {
        my $_it = $self->{key};
    }
    $self->{inode_number} = $self->{_io}->read_u8le();
    $self->{padding1} = $self->{_io}->read_bytes(1);
    $self->{inode_type} = $self->{_io}->read_u1();
    $self->{len_name} = $self->{_io}->read_u2le();
    $self->{cookie} = $self->{_io}->read_u4le();
    $self->{name} = $self->{_io}->read_bytes($self->len_name());
    $self->{name_terminator} = $self->{_io}->read_bytes(1);
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub inode_number {
    my ($self) = @_;
    return $self->{inode_number};
}

sub padding1 {
    my ($self) = @_;
    return $self->{padding1};
}

sub inode_type {
    my ($self) = @_;
    return $self->{inode_type};
}

sub len_name {
    my ($self) = @_;
    return $self->{len_name};
}

sub cookie {
    my ($self) = @_;
    return $self->{cookie};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub name_terminator {
    my ($self) = @_;
    return $self->{name_terminator};
}

sub _raw_key {
    my ($self) = @_;
    return $self->{_raw_key};
}

########################################################################
package Ubifs::Dummy;

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

}

########################################################################
package Ubifs::IndexBlock;

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

    $self->{header} = Ubifs::CommonHeader->new($self->{_io}, $self, $self->{_root});
    {
        my $_it = $self->{header};
    }
    $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
    my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
    $self->{node_header} = Ubifs::IndexHeader->new($io__raw_node_header, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub node_header {
    my ($self) = @_;
    return $self->{node_header};
}

sub _raw_node_header {
    my ($self) = @_;
    return $self->{_raw_node_header};
}

########################################################################
package Ubifs::IndexHeader;

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

    $self->{num_branches} = $self->{_io}->read_u2le();
    $self->{level} = $self->{_io}->read_u2le();
    $self->{branches} = [];
    my $n_branches = $self->num_branches();
    for (my $i = 0; $i < $n_branches; $i++) {
        push @{$self->{branches}}, Ubifs::Branch->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_branches {
    my ($self) = @_;
    return $self->{num_branches};
}

sub level {
    my ($self) = @_;
    return $self->{level};
}

sub branches {
    my ($self) = @_;
    return $self->{branches};
}

########################################################################
package Ubifs::InodeHeader;

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

    $self->{_raw_key} = $self->{_io}->read_bytes(16);
    my $io__raw_key = IO::KaitaiStruct::Stream->new($self->{_raw_key});
    $self->{key} = Ubifs::Key->new($io__raw_key, $self, $self->{_root});
    $self->{creation_sequence_number} = $self->{_io}->read_u8le();
    $self->{len_uncompressed} = $self->{_io}->read_u8le();
    $self->{atime_sec} = $self->{_io}->read_u8le();
    $self->{ctime_sec} = $self->{_io}->read_u8le();
    $self->{mtime_sec} = $self->{_io}->read_u8le();
    $self->{atime_nsec} = $self->{_io}->read_u4le();
    $self->{ctime_nsec} = $self->{_io}->read_u4le();
    $self->{mtime_nsec} = $self->{_io}->read_u4le();
    $self->{num_links} = $self->{_io}->read_u4le();
    $self->{uid} = $self->{_io}->read_u4le();
    $self->{gid} = $self->{_io}->read_u4le();
    $self->{mode} = $self->{_io}->read_u4le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{len_data} = $self->{_io}->read_u4le();
    $self->{num_xattrs} = $self->{_io}->read_u4le();
    $self->{xattr_size} = $self->{_io}->read_u4le();
    $self->{padding1} = $self->{_io}->read_bytes(4);
    $self->{xattr_names} = $self->{_io}->read_u4le();
    $self->{compression} = $self->{_io}->read_u2le();
    $self->{padding2} = $self->{_io}->read_bytes(26);
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
}

sub append {
    my ($self) = @_;
    return $self->{append} if ($self->{append});
    $self->{append} = ($self->flags() & 8) != 0;
    return $self->{append};
}

sub compressed {
    my ($self) = @_;
    return $self->{compressed} if ($self->{compressed});
    $self->{compressed} = ($self->flags() & 1) != 0;
    return $self->{compressed};
}

sub dirsync {
    my ($self) = @_;
    return $self->{dirsync} if ($self->{dirsync});
    $self->{dirsync} = ($self->flags() & 16) != 0;
    return $self->{dirsync};
}

sub encrypted {
    my ($self) = @_;
    return $self->{encrypted} if ($self->{encrypted});
    $self->{encrypted} = ($self->flags() & 64) != 0;
    return $self->{encrypted};
}

sub immutable {
    my ($self) = @_;
    return $self->{immutable} if ($self->{immutable});
    $self->{immutable} = ($self->flags() & 4) != 0;
    return $self->{immutable};
}

sub is_block_device {
    my ($self) = @_;
    return $self->{is_block_device} if ($self->{is_block_device});
    $self->{is_block_device} = ($self->mode() & 61440) == 24576;
    return $self->{is_block_device};
}

sub is_character_device {
    my ($self) = @_;
    return $self->{is_character_device} if ($self->{is_character_device});
    $self->{is_character_device} = ($self->mode() & 61440) == 8192;
    return $self->{is_character_device};
}

sub is_dir {
    my ($self) = @_;
    return $self->{is_dir} if ($self->{is_dir});
    $self->{is_dir} = ($self->mode() & 61440) == 16384;
    return $self->{is_dir};
}

sub is_fifo {
    my ($self) = @_;
    return $self->{is_fifo} if ($self->{is_fifo});
    $self->{is_fifo} = ($self->mode() & 61440) == 4096;
    return $self->{is_fifo};
}

sub is_link {
    my ($self) = @_;
    return $self->{is_link} if ($self->{is_link});
    $self->{is_link} = ($self->mode() & 61440) == 40960;
    return $self->{is_link};
}

sub is_regular {
    my ($self) = @_;
    return $self->{is_regular} if ($self->{is_regular});
    $self->{is_regular} = ($self->mode() & 61440) == 32768;
    return $self->{is_regular};
}

sub is_socket {
    my ($self) = @_;
    return $self->{is_socket} if ($self->{is_socket});
    $self->{is_socket} = ($self->mode() & 61440) == 49152;
    return $self->{is_socket};
}

sub synchronous {
    my ($self) = @_;
    return $self->{synchronous} if ($self->{synchronous});
    $self->{synchronous} = ($self->flags() & 2) != 0;
    return $self->{synchronous};
}

sub xattr {
    my ($self) = @_;
    return $self->{xattr} if ($self->{xattr});
    $self->{xattr} = ($self->flags() & 32) != 0;
    return $self->{xattr};
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub creation_sequence_number {
    my ($self) = @_;
    return $self->{creation_sequence_number};
}

sub len_uncompressed {
    my ($self) = @_;
    return $self->{len_uncompressed};
}

sub atime_sec {
    my ($self) = @_;
    return $self->{atime_sec};
}

sub ctime_sec {
    my ($self) = @_;
    return $self->{ctime_sec};
}

sub mtime_sec {
    my ($self) = @_;
    return $self->{mtime_sec};
}

sub atime_nsec {
    my ($self) = @_;
    return $self->{atime_nsec};
}

sub ctime_nsec {
    my ($self) = @_;
    return $self->{ctime_nsec};
}

sub mtime_nsec {
    my ($self) = @_;
    return $self->{mtime_nsec};
}

sub num_links {
    my ($self) = @_;
    return $self->{num_links};
}

sub uid {
    my ($self) = @_;
    return $self->{uid};
}

sub gid {
    my ($self) = @_;
    return $self->{gid};
}

sub mode {
    my ($self) = @_;
    return $self->{mode};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub num_xattrs {
    my ($self) = @_;
    return $self->{num_xattrs};
}

sub xattr_size {
    my ($self) = @_;
    return $self->{xattr_size};
}

sub padding1 {
    my ($self) = @_;
    return $self->{padding1};
}

sub xattr_names {
    my ($self) = @_;
    return $self->{xattr_names};
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub padding2 {
    my ($self) = @_;
    return $self->{padding2};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub _raw_key {
    my ($self) = @_;
    return $self->{_raw_key};
}

########################################################################
package Ubifs::Key;

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

    $self->{inode_number} = $self->{_io}->read_u4le();
    $self->{value} = $self->{_io}->read_bits_int_le(29);
    $self->{type} = $self->{_io}->read_bits_int_le(3);
    $self->{_io}->align_to_byte();
    $self->{unused} = $self->{_io}->read_bytes_full();
}

sub inode_number {
    my ($self) = @_;
    return $self->{inode_number};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

########################################################################
package Ubifs::MasterHeader;

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

    $self->{highest_inum} = $self->{_io}->read_u8le();
    $self->{commit_number} = $self->{_io}->read_u8le();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{leb_log} = $self->{_io}->read_u4le();
    $self->{leb_root} = $self->{_io}->read_u4le();
    $self->{ofs_root} = $self->{_io}->read_u4le();
    $self->{len_root} = $self->{_io}->read_u4le();
    $self->{leb_garbage_collect} = $self->{_io}->read_u4le();
    $self->{leb_index_head} = $self->{_io}->read_u4le();
    $self->{ofs_index_head} = $self->{_io}->read_u4le();
    $self->{len_index} = $self->{_io}->read_u8le();
    $self->{total_free} = $self->{_io}->read_u8le();
    $self->{total_dirty} = $self->{_io}->read_u8le();
    $self->{total_used} = $self->{_io}->read_u8le();
    $self->{total_dead} = $self->{_io}->read_u8le();
    $self->{total_dark} = $self->{_io}->read_u8le();
    $self->{leb_lpt} = $self->{_io}->read_u4le();
    $self->{ofs_lpt} = $self->{_io}->read_u4le();
    $self->{leb_nhead} = $self->{_io}->read_u4le();
    $self->{ofs_nhead} = $self->{_io}->read_u4le();
    $self->{leb_lprops_table} = $self->{_io}->read_u4le();
    $self->{ofs_lprops_table} = $self->{_io}->read_u4le();
    $self->{leb_save_table} = $self->{_io}->read_u4le();
    $self->{ofs_save_table} = $self->{_io}->read_u4le();
    $self->{leb_last_lpt_scan} = $self->{_io}->read_u4le();
    $self->{num_empty_lebs} = $self->{_io}->read_u4le();
    $self->{num_index_lebs} = $self->{_io}->read_u4le();
    $self->{num_lebs} = $self->{_io}->read_u4le();
    $self->{hash_root_index} = $self->{_io}->read_bytes(64);
    $self->{hash_lpt} = $self->{_io}->read_bytes(64);
    $self->{hmac} = $self->{_io}->read_bytes(64);
    $self->{padding} = $self->{_io}->read_bytes(152);
}

sub dirty {
    my ($self) = @_;
    return $self->{dirty} if ($self->{dirty});
    $self->{dirty} = ($self->flags() & 1) != 0;
    return $self->{dirty};
}

sub no_orphans {
    my ($self) = @_;
    return $self->{no_orphans} if ($self->{no_orphans});
    $self->{no_orphans} = ($self->flags() & 2) != 0;
    return $self->{no_orphans};
}

sub recovery {
    my ($self) = @_;
    return $self->{recovery} if ($self->{recovery});
    $self->{recovery} = ($self->flags() & 4) != 0;
    return $self->{recovery};
}

sub highest_inum {
    my ($self) = @_;
    return $self->{highest_inum};
}

sub commit_number {
    my ($self) = @_;
    return $self->{commit_number};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub leb_log {
    my ($self) = @_;
    return $self->{leb_log};
}

sub leb_root {
    my ($self) = @_;
    return $self->{leb_root};
}

sub ofs_root {
    my ($self) = @_;
    return $self->{ofs_root};
}

sub len_root {
    my ($self) = @_;
    return $self->{len_root};
}

sub leb_garbage_collect {
    my ($self) = @_;
    return $self->{leb_garbage_collect};
}

sub leb_index_head {
    my ($self) = @_;
    return $self->{leb_index_head};
}

sub ofs_index_head {
    my ($self) = @_;
    return $self->{ofs_index_head};
}

sub len_index {
    my ($self) = @_;
    return $self->{len_index};
}

sub total_free {
    my ($self) = @_;
    return $self->{total_free};
}

sub total_dirty {
    my ($self) = @_;
    return $self->{total_dirty};
}

sub total_used {
    my ($self) = @_;
    return $self->{total_used};
}

sub total_dead {
    my ($self) = @_;
    return $self->{total_dead};
}

sub total_dark {
    my ($self) = @_;
    return $self->{total_dark};
}

sub leb_lpt {
    my ($self) = @_;
    return $self->{leb_lpt};
}

sub ofs_lpt {
    my ($self) = @_;
    return $self->{ofs_lpt};
}

sub leb_nhead {
    my ($self) = @_;
    return $self->{leb_nhead};
}

sub ofs_nhead {
    my ($self) = @_;
    return $self->{ofs_nhead};
}

sub leb_lprops_table {
    my ($self) = @_;
    return $self->{leb_lprops_table};
}

sub ofs_lprops_table {
    my ($self) = @_;
    return $self->{ofs_lprops_table};
}

sub leb_save_table {
    my ($self) = @_;
    return $self->{leb_save_table};
}

sub ofs_save_table {
    my ($self) = @_;
    return $self->{ofs_save_table};
}

sub leb_last_lpt_scan {
    my ($self) = @_;
    return $self->{leb_last_lpt_scan};
}

sub num_empty_lebs {
    my ($self) = @_;
    return $self->{num_empty_lebs};
}

sub num_index_lebs {
    my ($self) = @_;
    return $self->{num_index_lebs};
}

sub num_lebs {
    my ($self) = @_;
    return $self->{num_lebs};
}

sub hash_root_index {
    my ($self) = @_;
    return $self->{hash_root_index};
}

sub hash_lpt {
    my ($self) = @_;
    return $self->{hash_lpt};
}

sub hmac {
    my ($self) = @_;
    return $self->{hmac};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Ubifs::MasterblockNode;

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

    $self->{header} = Ubifs::CommonHeader->new($self->{_io}, $self, $self->{_root});
    {
        my $_it = $self->{header};
    }
    $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
    my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
    $self->{node_header} = Ubifs::MasterHeader->new($io__raw_node_header, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub node_header {
    my ($self) = @_;
    return $self->{node_header};
}

sub _raw_node_header {
    my ($self) = @_;
    return $self->{_raw_node_header};
}

########################################################################
package Ubifs::OrphanHeader;

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

    $self->{commit_number} = $self->{_io}->read_u8le();
    $self->{inode_numbers} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{inode_numbers}}, $self->{_io}->read_u8le();
    }
}

sub commit_number {
    my ($self) = @_;
    return $self->{commit_number};
}

sub inode_numbers {
    my ($self) = @_;
    return $self->{inode_numbers};
}

########################################################################
package Ubifs::PaddingHeader;

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

    $self->{len_padding} = $self->{_io}->read_u4le();
}

sub len_padding {
    my ($self) = @_;
    return $self->{len_padding};
}

########################################################################
package Ubifs::ReferenceHeader;

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

    $self->{leb_number} = $self->{_io}->read_u4le();
    $self->{ofs_leb} = $self->{_io}->read_u4le();
    $self->{journal_head_number} = $self->{_io}->read_u4le();
    $self->{padding} = $self->{_io}->read_bytes(28);
}

sub leb_number {
    my ($self) = @_;
    return $self->{leb_number};
}

sub ofs_leb {
    my ($self) = @_;
    return $self->{ofs_leb};
}

sub journal_head_number {
    my ($self) = @_;
    return $self->{journal_head_number};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

########################################################################
package Ubifs::SignatureHeader;

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

    $self->{type} = $self->{_io}->read_u4le();
    $self->{len_signature} = $self->{_io}->read_u4le();
    $self->{padding} = $self->{_io}->read_bytes(32);
    $self->{signature} = $self->{_io}->read_bytes($self->len_signature());
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub len_signature {
    my ($self) = @_;
    return $self->{len_signature};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

########################################################################
package Ubifs::SuperblockHeader;

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

    $self->{padding0} = $self->{_io}->read_bytes(2);
    $self->{key_hash} = $self->{_io}->read_u1();
    $self->{key_fmt} = $self->{_io}->read_u1();
    $self->{flags} = $self->{_io}->read_u4le();
    $self->{min_io_size} = $self->{_io}->read_u4le();
    $self->{leb_size} = $self->{_io}->read_u4le();
    $self->{num_lebs} = $self->{_io}->read_u4le();
    $self->{max_num_lebs} = $self->{_io}->read_u4le();
    $self->{max_bud_bytes} = $self->{_io}->read_u8le();
    $self->{num_log_lebs} = $self->{_io}->read_u4le();
    $self->{num_lpt_lebs} = $self->{_io}->read_u4le();
    $self->{num_orphan_lebs} = $self->{_io}->read_u4le();
    $self->{num_journal_heads} = $self->{_io}->read_u4le();
    $self->{fanout} = $self->{_io}->read_u4le();
    $self->{num_save_table_entries} = $self->{_io}->read_u4le();
    $self->{fmt_version} = $self->{_io}->read_u4le();
    $self->{default_compression} = $self->{_io}->read_u2le();
    $self->{padding1} = $self->{_io}->read_bytes(2);
    $self->{reserve_pool_uid} = $self->{_io}->read_u4le();
    $self->{reserve_pool_gid} = $self->{_io}->read_u4le();
    $self->{reserve_pool_size} = $self->{_io}->read_u8le();
    $self->{time_granularity} = $self->{_io}->read_u4le();
    $self->{uuid} = $self->{_io}->read_bytes(16);
    $self->{ro_compat_version} = $self->{_io}->read_u4le();
    $self->{hmac} = $self->{_io}->read_bytes(64);
    $self->{hmac_wkm} = $self->{_io}->read_bytes(64);
    if ($self->authenticated()) {
        $self->{hash_algo} = $self->{_io}->read_u2le();
    }
    if (!($self->authenticated())) {
        $self->{hash_algo_unused} = $self->{_io}->read_u2le();
    }
    $self->{hash_mst} = $self->{_io}->read_bytes(64);
    $self->{padding2} = $self->{_io}->read_bytes(3774);
}

sub authenticated {
    my ($self) = @_;
    return $self->{authenticated} if ($self->{authenticated});
    $self->{authenticated} = ($self->flags() & 32) != 0;
    return $self->{authenticated};
}

sub biglpt {
    my ($self) = @_;
    return $self->{biglpt} if ($self->{biglpt});
    $self->{biglpt} = ($self->flags() & 2) != 0;
    return $self->{biglpt};
}

sub double_hash {
    my ($self) = @_;
    return $self->{double_hash} if ($self->{double_hash});
    $self->{double_hash} = ($self->flags() & 8) != 0;
    return $self->{double_hash};
}

sub encrypted {
    my ($self) = @_;
    return $self->{encrypted} if ($self->{encrypted});
    $self->{encrypted} = ($self->flags() & 16) != 0;
    return $self->{encrypted};
}

sub len_hash {
    my ($self) = @_;
    return $self->{len_hash} if ($self->{len_hash});
    $self->{len_hash} = (!($self->authenticated()) ? 0 : ( (($self->hash_algo() == $Ubifs::HASH_ALGOS_MD4) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_MD5) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_RIPE_MD_128) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_TGR_128))  ? 16 : ( (($self->hash_algo() == $Ubifs::HASH_ALGOS_SHA1) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_RIPE_MD_160) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_TGR_160))  ? 20 : ($self->hash_algo() == $Ubifs::HASH_ALGOS_TGR_192 ? 24 : ($self->hash_algo() == $Ubifs::HASH_ALGOS_SHA224 ? 28 : ( (($self->hash_algo() == $Ubifs::HASH_ALGOS_SHA256) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_RIPE_MD_256) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_WP_256) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_SM3_256) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_STREEBOG_256) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_SHA3_256))  ? 32 : ($self->hash_algo() == $Ubifs::HASH_ALGOS_RIPE_MD_320 ? 40 : ( (($self->hash_algo() == $Ubifs::HASH_ALGOS_SHA384) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_WP_384) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_SHA3_384))  ? 48 : ( (($self->hash_algo() == $Ubifs::HASH_ALGOS_SHA512) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_WP_512) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_STREEBOG_512) || ($self->hash_algo() == $Ubifs::HASH_ALGOS_SHA3_512))  ? 64 : -1)))))))));
    return $self->{len_hash};
}

sub space_fixup {
    my ($self) = @_;
    return $self->{space_fixup} if ($self->{space_fixup});
    $self->{space_fixup} = ($self->flags() & 4) != 0;
    return $self->{space_fixup};
}

sub padding0 {
    my ($self) = @_;
    return $self->{padding0};
}

sub key_hash {
    my ($self) = @_;
    return $self->{key_hash};
}

sub key_fmt {
    my ($self) = @_;
    return $self->{key_fmt};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub min_io_size {
    my ($self) = @_;
    return $self->{min_io_size};
}

sub leb_size {
    my ($self) = @_;
    return $self->{leb_size};
}

sub num_lebs {
    my ($self) = @_;
    return $self->{num_lebs};
}

sub max_num_lebs {
    my ($self) = @_;
    return $self->{max_num_lebs};
}

sub max_bud_bytes {
    my ($self) = @_;
    return $self->{max_bud_bytes};
}

sub num_log_lebs {
    my ($self) = @_;
    return $self->{num_log_lebs};
}

sub num_lpt_lebs {
    my ($self) = @_;
    return $self->{num_lpt_lebs};
}

sub num_orphan_lebs {
    my ($self) = @_;
    return $self->{num_orphan_lebs};
}

sub num_journal_heads {
    my ($self) = @_;
    return $self->{num_journal_heads};
}

sub fanout {
    my ($self) = @_;
    return $self->{fanout};
}

sub num_save_table_entries {
    my ($self) = @_;
    return $self->{num_save_table_entries};
}

sub fmt_version {
    my ($self) = @_;
    return $self->{fmt_version};
}

sub default_compression {
    my ($self) = @_;
    return $self->{default_compression};
}

sub padding1 {
    my ($self) = @_;
    return $self->{padding1};
}

sub reserve_pool_uid {
    my ($self) = @_;
    return $self->{reserve_pool_uid};
}

sub reserve_pool_gid {
    my ($self) = @_;
    return $self->{reserve_pool_gid};
}

sub reserve_pool_size {
    my ($self) = @_;
    return $self->{reserve_pool_size};
}

sub time_granularity {
    my ($self) = @_;
    return $self->{time_granularity};
}

sub uuid {
    my ($self) = @_;
    return $self->{uuid};
}

sub ro_compat_version {
    my ($self) = @_;
    return $self->{ro_compat_version};
}

sub hmac {
    my ($self) = @_;
    return $self->{hmac};
}

sub hmac_wkm {
    my ($self) = @_;
    return $self->{hmac_wkm};
}

sub hash_algo {
    my ($self) = @_;
    return $self->{hash_algo};
}

sub hash_algo_unused {
    my ($self) = @_;
    return $self->{hash_algo_unused};
}

sub hash_mst {
    my ($self) = @_;
    return $self->{hash_mst};
}

sub padding2 {
    my ($self) = @_;
    return $self->{padding2};
}

########################################################################
package Ubifs::SuperblockNode;

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

    $self->{header} = Ubifs::CommonHeader->new($self->{_io}, $self, $self->{_root});
    {
        my $_it = $self->{header};
    }
    $self->{_raw_node_header} = $self->{_io}->read_bytes($self->header()->len_full_node() - 24);
    my $io__raw_node_header = IO::KaitaiStruct::Stream->new($self->{_raw_node_header});
    $self->{node_header} = Ubifs::SuperblockHeader->new($io__raw_node_header, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub node_header {
    my ($self) = @_;
    return $self->{node_header};
}

sub _raw_node_header {
    my ($self) = @_;
    return $self->{_raw_node_header};
}

########################################################################
package Ubifs::TruncationHeader;

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

    $self->{inode_number} = $self->{_io}->read_u4le();
    $self->{padding} = $self->{_io}->read_bytes(12);
    $self->{old_size} = $self->{_io}->read_u8le();
    $self->{new_size} = $self->{_io}->read_u8le();
}

sub inode_number {
    my ($self) = @_;
    return $self->{inode_number};
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub old_size {
    my ($self) = @_;
    return $self->{old_size};
}

sub new_size {
    my ($self) = @_;
    return $self->{new_size};
}

1;
