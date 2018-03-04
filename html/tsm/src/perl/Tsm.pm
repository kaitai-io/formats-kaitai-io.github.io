# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Tsm;

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

    $self->{header} = Tsm::Header->new($self->{_io}, $self, $self->{_root});
}

sub index {
    my ($self) = @_;
    return $self->{index} if ($self->{index});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->_io()->size() - 8));
    $self->{index} = Tsm::Index->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{index};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

########################################################################
package Tsm::Header;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (22, 209, 22, 209)));
    $self->{version} = $self->{_io}->read_u1();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

########################################################################
package Tsm::Index;

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

    $self->{offset} = $self->{_io}->read_u8be();
}

sub entries {
    my ($self) = @_;
    return $self->{entries} if ($self->{entries});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->offset());
    $self->{entries} = ();
    do {
        $_ = Tsm::Index::IndexHeader->new($self->{_io}, $self, $self->{_root});
        push @{$self->{entries}}, $_;
    } until ($self->_io()->pos() == ($self->_io()->size() - 8));
    $self->{_io}->seek($_pos);
    return $self->{entries};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

########################################################################
package Tsm::Index::IndexHeader;

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

    $self->{key_len} = $self->{_io}->read_u2be();
    $self->{key} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->key_len()));
    $self->{type} = $self->{_io}->read_u1();
    $self->{entry_count} = $self->{_io}->read_u2be();
    $self->{index_entries} = ();
    my $n_index_entries = $self->entry_count();
    for (my $i = 0; $i < $n_index_entries; $i++) {
        $self->{index_entries}[$i] = Tsm::Index::IndexHeader::IndexEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub key_len {
    my ($self) = @_;
    return $self->{key_len};
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub entry_count {
    my ($self) = @_;
    return $self->{entry_count};
}

sub index_entries {
    my ($self) = @_;
    return $self->{index_entries};
}

########################################################################
package Tsm::Index::IndexHeader::IndexEntry;

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

    $self->{min_time} = $self->{_io}->read_u8be();
    $self->{max_time} = $self->{_io}->read_u8be();
    $self->{block_offset} = $self->{_io}->read_u8be();
    $self->{block_size} = $self->{_io}->read_u4be();
}

sub block {
    my ($self) = @_;
    return $self->{block} if ($self->{block});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->block_offset());
    $self->{block} = Tsm::Index::IndexHeader::IndexEntry::BlockEntry->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{block};
}

sub min_time {
    my ($self) = @_;
    return $self->{min_time};
}

sub max_time {
    my ($self) = @_;
    return $self->{max_time};
}

sub block_offset {
    my ($self) = @_;
    return $self->{block_offset};
}

sub block_size {
    my ($self) = @_;
    return $self->{block_size};
}

########################################################################
package Tsm::Index::IndexHeader::IndexEntry::BlockEntry;

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

    $self->{crc32} = $self->{_io}->read_u4be();
    $self->{data} = $self->{_io}->read_bytes(($self->_parent()->block_size() - 4));
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

1;
