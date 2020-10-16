# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package DsStore;

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

    $self->{alignment_header} = $self->{_io}->read_bytes(4);
    $self->{buddy_allocator_header} = DsStore::BuddyAllocatorHeader->new($self->{_io}, $self, $self->{_root});
}

sub buddy_allocator_body {
    my ($self) = @_;
    return $self->{buddy_allocator_body} if ($self->{buddy_allocator_body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->buddy_allocator_header()->ofs_bookkeeping_info_block() + 4));
    $self->{_raw_buddy_allocator_body} = $self->{_io}->read_bytes($self->buddy_allocator_header()->len_bookkeeping_info_block());
    my $io__raw_buddy_allocator_body = IO::KaitaiStruct::Stream->new($self->{_raw_buddy_allocator_body});
    $self->{buddy_allocator_body} = DsStore::BuddyAllocatorBody->new($io__raw_buddy_allocator_body, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{buddy_allocator_body};
}

sub block_address_mask {
    my ($self) = @_;
    return $self->{block_address_mask} if ($self->{block_address_mask});
    $self->{block_address_mask} = 31;
    return $self->{block_address_mask};
}

sub alignment_header {
    my ($self) = @_;
    return $self->{alignment_header};
}

sub buddy_allocator_header {
    my ($self) = @_;
    return $self->{buddy_allocator_header};
}

sub _raw_buddy_allocator_body {
    my ($self) = @_;
    return $self->{_raw_buddy_allocator_body};
}

########################################################################
package DsStore::BuddyAllocatorHeader;

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
    $self->{ofs_bookkeeping_info_block} = $self->{_io}->read_u4be();
    $self->{len_bookkeeping_info_block} = $self->{_io}->read_u4be();
    $self->{copy_ofs_bookkeeping_info_block} = $self->{_io}->read_u4be();
    $self->{_unnamed4} = $self->{_io}->read_bytes(16);
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub ofs_bookkeeping_info_block {
    my ($self) = @_;
    return $self->{ofs_bookkeeping_info_block};
}

sub len_bookkeeping_info_block {
    my ($self) = @_;
    return $self->{len_bookkeeping_info_block};
}

sub copy_ofs_bookkeeping_info_block {
    my ($self) = @_;
    return $self->{copy_ofs_bookkeeping_info_block};
}

sub _unnamed4 {
    my ($self) = @_;
    return $self->{_unnamed4};
}

########################################################################
package DsStore::BuddyAllocatorBody;

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

    $self->{num_blocks} = $self->{_io}->read_u4be();
    $self->{_unnamed1} = $self->{_io}->read_bytes(4);
    $self->{block_addresses} = ();
    my $n_block_addresses = $self->num_block_addresses();
    for (my $i = 0; $i < $n_block_addresses; $i++) {
        $self->{block_addresses}[$i] = DsStore::BuddyAllocatorBody::BlockDescriptor->new($self->{_io}, $self, $self->{_root});
    }
    $self->{num_directories} = $self->{_io}->read_u4be();
    $self->{directory_entries} = ();
    my $n_directory_entries = $self->num_directories();
    for (my $i = 0; $i < $n_directory_entries; $i++) {
        $self->{directory_entries}[$i] = DsStore::BuddyAllocatorBody::DirectoryEntry->new($self->{_io}, $self, $self->{_root});
    }
    $self->{free_lists} = ();
    my $n_free_lists = $self->num_free_lists();
    for (my $i = 0; $i < $n_free_lists; $i++) {
        $self->{free_lists}[$i] = DsStore::BuddyAllocatorBody::FreeList->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_block_addresses {
    my ($self) = @_;
    return $self->{num_block_addresses} if ($self->{num_block_addresses});
    $self->{num_block_addresses} = 256;
    return $self->{num_block_addresses};
}

sub num_free_lists {
    my ($self) = @_;
    return $self->{num_free_lists} if ($self->{num_free_lists});
    $self->{num_free_lists} = 32;
    return $self->{num_free_lists};
}

sub directories {
    my ($self) = @_;
    return $self->{directories} if ($self->{directories});
    my $io = $self->_root()->_io();
    $self->{directories} = ();
    my $n_directories = $self->num_directories();
    for (my $i = 0; $i < $n_directories; $i++) {
        $self->{directories}[$i] = DsStore::MasterBlockRef->new($io, $self, $self->{_root});
    }
    return $self->{directories};
}

sub num_blocks {
    my ($self) = @_;
    return $self->{num_blocks};
}

sub _unnamed1 {
    my ($self) = @_;
    return $self->{_unnamed1};
}

sub block_addresses {
    my ($self) = @_;
    return $self->{block_addresses};
}

sub num_directories {
    my ($self) = @_;
    return $self->{num_directories};
}

sub directory_entries {
    my ($self) = @_;
    return $self->{directory_entries};
}

sub free_lists {
    my ($self) = @_;
    return $self->{free_lists};
}

########################################################################
package DsStore::BuddyAllocatorBody::BlockDescriptor;

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

    $self->{address_raw} = $self->{_io}->read_u4be();
}

sub offset {
    my ($self) = @_;
    return $self->{offset} if ($self->{offset});
    $self->{offset} = (($self->address_raw() & ~($self->_root()->block_address_mask())) + 4);
    return $self->{offset};
}

sub size {
    my ($self) = @_;
    return $self->{size} if ($self->{size});
    $self->{size} = ((1 << $self->address_raw()) & $self->_root()->block_address_mask());
    return $self->{size};
}

sub address_raw {
    my ($self) = @_;
    return $self->{address_raw};
}

########################################################################
package DsStore::BuddyAllocatorBody::DirectoryEntry;

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

    $self->{len_name} = $self->{_io}->read_u1();
    $self->{name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_name()));
    $self->{block_id} = $self->{_io}->read_u4be();
}

sub len_name {
    my ($self) = @_;
    return $self->{len_name};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub block_id {
    my ($self) = @_;
    return $self->{block_id};
}

########################################################################
package DsStore::BuddyAllocatorBody::FreeList;

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

    $self->{counter} = $self->{_io}->read_u4be();
    $self->{offsets} = ();
    my $n_offsets = $self->counter();
    for (my $i = 0; $i < $n_offsets; $i++) {
        $self->{offsets}[$i] = $self->{_io}->read_u4be();
    }
}

sub counter {
    my ($self) = @_;
    return $self->{counter};
}

sub offsets {
    my ($self) = @_;
    return $self->{offsets};
}

########################################################################
package DsStore::MasterBlockRef;

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

sub master_block {
    my ($self) = @_;
    return $self->{master_block} if ($self->{master_block});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(@{$self->_parent()->block_addresses()}[@{$self->_parent()->directory_entries()}[$self->idx()]->block_id()]->offset());
    $self->{_raw_master_block} = $self->{_io}->read_bytes(@{$self->_parent()->block_addresses()}[@{$self->_parent()->directory_entries()}[$self->idx()]->block_id()]->size());
    my $io__raw_master_block = IO::KaitaiStruct::Stream->new($self->{_raw_master_block});
    $self->{master_block} = DsStore::MasterBlockRef::MasterBlock->new($io__raw_master_block, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{master_block};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

sub _raw_master_block {
    my ($self) = @_;
    return $self->{_raw_master_block};
}

########################################################################
package DsStore::MasterBlockRef::MasterBlock;

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

    $self->{block_id} = $self->{_io}->read_u4be();
    $self->{num_internal_nodes} = $self->{_io}->read_u4be();
    $self->{num_records} = $self->{_io}->read_u4be();
    $self->{num_nodes} = $self->{_io}->read_u4be();
    $self->{_unnamed4} = $self->{_io}->read_u4be();
}

sub root_block {
    my ($self) = @_;
    return $self->{root_block} if ($self->{root_block});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek(@{$self->_root()->buddy_allocator_body()->block_addresses()}[$self->block_id()]->offset());
    $self->{root_block} = DsStore::Block->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{root_block};
}

sub block_id {
    my ($self) = @_;
    return $self->{block_id};
}

sub num_internal_nodes {
    my ($self) = @_;
    return $self->{num_internal_nodes};
}

sub num_records {
    my ($self) = @_;
    return $self->{num_records};
}

sub num_nodes {
    my ($self) = @_;
    return $self->{num_nodes};
}

sub _unnamed4 {
    my ($self) = @_;
    return $self->{_unnamed4};
}

########################################################################
package DsStore::Block;

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

    $self->{mode} = $self->{_io}->read_u4be();
    $self->{counter} = $self->{_io}->read_u4be();
    $self->{data} = ();
    my $n_data = $self->counter();
    for (my $i = 0; $i < $n_data; $i++) {
        $self->{data}[$i] = DsStore::Block::BlockData->new($self->{_io}, $self, $self->{_root});
    }
}

sub rightmost_block {
    my ($self) = @_;
    return $self->{rightmost_block} if ($self->{rightmost_block});
    if ($self->mode() > 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek(@{$self->_root()->buddy_allocator_body()->block_addresses()}[$self->mode()]->offset());
        $self->{rightmost_block} = DsStore::Block->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{rightmost_block};
}

sub mode {
    my ($self) = @_;
    return $self->{mode};
}

sub counter {
    my ($self) = @_;
    return $self->{counter};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package DsStore::Block::BlockData;

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

    if ($self->mode() > 0) {
        $self->{block_id} = $self->{_io}->read_u4be();
    }
    $self->{record} = DsStore::Block::BlockData::Record->new($self->{_io}, $self, $self->{_root});
}

sub block {
    my ($self) = @_;
    return $self->{block} if ($self->{block});
    if ($self->mode() > 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek(@{$self->_root()->buddy_allocator_body()->block_addresses()}[$self->block_id()]->offset());
        $self->{block} = DsStore::Block->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{block};
}

sub block_id {
    my ($self) = @_;
    return $self->{block_id};
}

sub record {
    my ($self) = @_;
    return $self->{record};
}

sub mode {
    my ($self) = @_;
    return $self->{mode};
}

########################################################################
package DsStore::Block::BlockData::Record;

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

    $self->{filename} = DsStore::Block::BlockData::Record::Ustr->new($self->{_io}, $self, $self->{_root});
    $self->{structure_type} = DsStore::Block::BlockData::Record::FourCharCode->new($self->{_io}, $self, $self->{_root});
    $self->{data_type} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
    my $_on = $self->data_type();
    if ($_on eq "long") {
        $self->{value} = $self->{_io}->read_u4be();
    }
    elsif ($_on eq "shor") {
        $self->{value} = $self->{_io}->read_u4be();
    }
    elsif ($_on eq "comp") {
        $self->{value} = $self->{_io}->read_u8be();
    }
    elsif ($_on eq "bool") {
        $self->{value} = $self->{_io}->read_u1();
    }
    elsif ($_on eq "ustr") {
        $self->{value} = DsStore::Block::BlockData::Record::Ustr->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on eq "dutc") {
        $self->{value} = $self->{_io}->read_u8be();
    }
    elsif ($_on eq "type") {
        $self->{value} = DsStore::Block::BlockData::Record::FourCharCode->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on eq "blob") {
        $self->{value} = DsStore::Block::BlockData::Record::RecordBlob->new($self->{_io}, $self, $self->{_root});
    }
}

sub filename {
    my ($self) = @_;
    return $self->{filename};
}

sub structure_type {
    my ($self) = @_;
    return $self->{structure_type};
}

sub data_type {
    my ($self) = @_;
    return $self->{data_type};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package DsStore::Block::BlockData::Record::RecordBlob;

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

    $self->{length} = $self->{_io}->read_u4be();
    $self->{value} = $self->{_io}->read_bytes($self->length());
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package DsStore::Block::BlockData::Record::Ustr;

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

    $self->{length} = $self->{_io}->read_u4be();
    $self->{value} = Encode::decode("UTF-16BE", $self->{_io}->read_bytes((2 * $self->length())));
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package DsStore::Block::BlockData::Record::FourCharCode;

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

    $self->{value} = Encode::decode("UTF-8", $self->{_io}->read_bytes(4));
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
