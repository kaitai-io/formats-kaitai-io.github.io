# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package GptPartitionTable;

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

sub backup {
    my ($self) = @_;
    return $self->{backup} if ($self->{backup});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->_io()->size() - $self->_root()->sector_size());
    $self->{backup} = GptPartitionTable::PartitionHeader->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{backup};
}

sub primary {
    my ($self) = @_;
    return $self->{primary} if ($self->{primary});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->_root()->sector_size());
    $self->{primary} = GptPartitionTable::PartitionHeader->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{primary};
}

sub sector_size {
    my ($self) = @_;
    return $self->{sector_size} if ($self->{sector_size});
    $self->{sector_size} = 512;
    return $self->{sector_size};
}

########################################################################
package GptPartitionTable::PartitionEntry;

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

    $self->{type_guid} = $self->{_io}->read_bytes(16);
    $self->{guid} = $self->{_io}->read_bytes(16);
    $self->{first_lba} = $self->{_io}->read_u8le();
    $self->{last_lba} = $self->{_io}->read_u8le();
    $self->{attributes} = $self->{_io}->read_u8le();
    $self->{name} = Encode::decode("UTF-16LE", $self->{_io}->read_bytes(72));
}

sub type_guid {
    my ($self) = @_;
    return $self->{type_guid};
}

sub guid {
    my ($self) = @_;
    return $self->{guid};
}

sub first_lba {
    my ($self) = @_;
    return $self->{first_lba};
}

sub last_lba {
    my ($self) = @_;
    return $self->{last_lba};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package GptPartitionTable::PartitionHeader;

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

    $self->{signature} = $self->{_io}->read_bytes(8);
    $self->{revision} = $self->{_io}->read_u4le();
    $self->{header_size} = $self->{_io}->read_u4le();
    $self->{crc32_header} = $self->{_io}->read_u4le();
    $self->{reserved} = $self->{_io}->read_u4le();
    $self->{current_lba} = $self->{_io}->read_u8le();
    $self->{backup_lba} = $self->{_io}->read_u8le();
    $self->{first_usable_lba} = $self->{_io}->read_u8le();
    $self->{last_usable_lba} = $self->{_io}->read_u8le();
    $self->{disk_guid} = $self->{_io}->read_bytes(16);
    $self->{entries_start} = $self->{_io}->read_u8le();
    $self->{entries_count} = $self->{_io}->read_u4le();
    $self->{entries_size} = $self->{_io}->read_u4le();
    $self->{crc32_array} = $self->{_io}->read_u4le();
}

sub entries {
    my ($self) = @_;
    return $self->{entries} if ($self->{entries});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->entries_start() * $self->_root()->sector_size());
    $self->{_raw_entries} = [];
    $self->{entries} = [];
    my $n_entries = $self->entries_count();
    for (my $i = 0; $i < $n_entries; $i++) {
        push @{$self->{_raw_entries}}, $io->read_bytes($self->entries_size());
        my $io__raw_entries = IO::KaitaiStruct::Stream->new($self->{_raw_entries}[$i]);
        push @{$self->{entries}}, GptPartitionTable::PartitionEntry->new($io__raw_entries, $self, $self->{_root});
    }
    $io->seek($_pos);
    return $self->{entries};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub revision {
    my ($self) = @_;
    return $self->{revision};
}

sub header_size {
    my ($self) = @_;
    return $self->{header_size};
}

sub crc32_header {
    my ($self) = @_;
    return $self->{crc32_header};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub current_lba {
    my ($self) = @_;
    return $self->{current_lba};
}

sub backup_lba {
    my ($self) = @_;
    return $self->{backup_lba};
}

sub first_usable_lba {
    my ($self) = @_;
    return $self->{first_usable_lba};
}

sub last_usable_lba {
    my ($self) = @_;
    return $self->{last_usable_lba};
}

sub disk_guid {
    my ($self) = @_;
    return $self->{disk_guid};
}

sub entries_start {
    my ($self) = @_;
    return $self->{entries_start};
}

sub entries_count {
    my ($self) = @_;
    return $self->{entries_count};
}

sub entries_size {
    my ($self) = @_;
    return $self->{entries_size};
}

sub crc32_array {
    my ($self) = @_;
    return $self->{crc32_array};
}

sub _raw_entries {
    my ($self) = @_;
    return $self->{_raw_entries};
}

1;
