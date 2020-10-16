# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Riff;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $FOURCC_RIFF = 1179011410;
our $FOURCC_INFO = 1330007625;
our $FOURCC_LIST = 1414744396;

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

    $self->{chunk} = Riff::Chunk->new($self->{_io}, $self, $self->{_root});
}

sub chunk_id {
    my ($self) = @_;
    return $self->{chunk_id} if ($self->{chunk_id});
    $self->{chunk_id} = $self->chunk()->id();
    return $self->{chunk_id};
}

sub is_riff_chunk {
    my ($self) = @_;
    return $self->{is_riff_chunk} if ($self->{is_riff_chunk});
    $self->{is_riff_chunk} = $self->chunk_id() == $Riff::FOURCC_RIFF;
    return $self->{is_riff_chunk};
}

sub parent_chunk_data {
    my ($self) = @_;
    return $self->{parent_chunk_data} if ($self->{parent_chunk_data});
    if ($self->is_riff_chunk()) {
        my $io = $self->chunk()->data_slot()->_io();
        my $_pos = $io->pos();
        $io->seek(0);
        $self->{parent_chunk_data} = Riff::ParentChunkData->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{parent_chunk_data};
}

sub subchunks {
    my ($self) = @_;
    return $self->{subchunks} if ($self->{subchunks});
    if ($self->is_riff_chunk()) {
        my $io = $self->parent_chunk_data()->subchunks_slot()->_io();
        my $_pos = $io->pos();
        $io->seek(0);
        $self->{subchunks} = ();
        while (!$io->is_eof()) {
            push @{$self->{subchunks}}, Riff::ChunkType->new($io, $self, $self->{_root});
        }
        $io->seek($_pos);
    }
    return $self->{subchunks};
}

sub chunk {
    my ($self) = @_;
    return $self->{chunk};
}

########################################################################
package Riff::ListChunkData;

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

    if ($self->parent_chunk_data_ofs() < 0) {
        $self->{save_parent_chunk_data_ofs} = $self->{_io}->read_bytes(0);
    }
    $self->{parent_chunk_data} = Riff::ParentChunkData->new($self->{_io}, $self, $self->{_root});
}

sub parent_chunk_data_ofs {
    my ($self) = @_;
    return $self->{parent_chunk_data_ofs} if ($self->{parent_chunk_data_ofs});
    $self->{parent_chunk_data_ofs} = $self->_io()->pos();
    return $self->{parent_chunk_data_ofs};
}

sub form_type {
    my ($self) = @_;
    return $self->{form_type} if ($self->{form_type});
    $self->{form_type} = $self->parent_chunk_data()->form_type();
    return $self->{form_type};
}

sub form_type_readable {
    my ($self) = @_;
    return $self->{form_type_readable} if ($self->{form_type_readable});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->parent_chunk_data_ofs());
    $self->{form_type_readable} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{_io}->seek($_pos);
    return $self->{form_type_readable};
}

sub subchunks {
    my ($self) = @_;
    return $self->{subchunks} if ($self->{subchunks});
    my $io = $self->parent_chunk_data()->subchunks_slot()->_io();
    my $_pos = $io->pos();
    $io->seek(0);
    $self->{subchunks} = ();
    while (!$io->is_eof()) {
        my $_on = $self->form_type();
        if ($_on == $Riff::FOURCC_INFO) {
            push @{$self->{subchunks}}, Riff::InfoSubchunk->new($io, $self, $self->{_root});
        }
        else {
            push @{$self->{subchunks}}, Riff::ChunkType->new($io, $self, $self->{_root});
        }
    }
    $io->seek($_pos);
    return $self->{subchunks};
}

sub save_parent_chunk_data_ofs {
    my ($self) = @_;
    return $self->{save_parent_chunk_data_ofs};
}

sub parent_chunk_data {
    my ($self) = @_;
    return $self->{parent_chunk_data};
}

########################################################################
package Riff::Chunk;

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

    $self->{id} = $self->{_io}->read_u4le();
    $self->{len} = $self->{_io}->read_u4le();
    $self->{_raw_data_slot} = $self->{_io}->read_bytes($self->len());
    my $io__raw_data_slot = IO::KaitaiStruct::Stream->new($self->{_raw_data_slot});
    $self->{data_slot} = Riff::Chunk::Slot->new($io__raw_data_slot, $self, $self->{_root});
    $self->{pad_byte} = $self->{_io}->read_bytes(($self->len() % 2));
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub len {
    my ($self) = @_;
    return $self->{len};
}

sub data_slot {
    my ($self) = @_;
    return $self->{data_slot};
}

sub pad_byte {
    my ($self) = @_;
    return $self->{pad_byte};
}

sub _raw_data_slot {
    my ($self) = @_;
    return $self->{_raw_data_slot};
}

########################################################################
package Riff::Chunk::Slot;

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

########################################################################
package Riff::ParentChunkData;

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

    $self->{form_type} = $self->{_io}->read_u4le();
    $self->{_raw_subchunks_slot} = $self->{_io}->read_bytes_full();
    my $io__raw_subchunks_slot = IO::KaitaiStruct::Stream->new($self->{_raw_subchunks_slot});
    $self->{subchunks_slot} = Riff::ParentChunkData::Slot->new($io__raw_subchunks_slot, $self, $self->{_root});
}

sub form_type {
    my ($self) = @_;
    return $self->{form_type};
}

sub subchunks_slot {
    my ($self) = @_;
    return $self->{subchunks_slot};
}

sub _raw_subchunks_slot {
    my ($self) = @_;
    return $self->{_raw_subchunks_slot};
}

########################################################################
package Riff::ParentChunkData::Slot;

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

########################################################################
package Riff::InfoSubchunk;

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

    if ($self->chunk_ofs() < 0) {
        $self->{save_chunk_ofs} = $self->{_io}->read_bytes(0);
    }
    $self->{chunk} = Riff::Chunk->new($self->{_io}, $self, $self->{_root});
}

sub chunk_data {
    my ($self) = @_;
    return $self->{chunk_data} if ($self->{chunk_data});
    my $io = $self->chunk()->data_slot()->_io();
    my $_pos = $io->pos();
    $io->seek(0);
    my $_on = $self->is_unregistered_tag();
    if ($_on == 0) {
        $self->{chunk_data} = Encode::decode("UTF-8", $io->read_bytes_term(0, 0, 1, 1));
    }
    $io->seek($_pos);
    return $self->{chunk_data};
}

sub is_unregistered_tag {
    my ($self) = @_;
    return $self->{is_unregistered_tag} if ($self->{is_unregistered_tag});
    $self->{is_unregistered_tag} =  (( ((@{$self->id_chars()}[0] >= 97) && (@{$self->id_chars()}[0] <= 122)) ) || ( ((@{$self->id_chars()}[1] >= 97) && (@{$self->id_chars()}[1] <= 122)) ) || ( ((@{$self->id_chars()}[2] >= 97) && (@{$self->id_chars()}[2] <= 122)) ) || ( ((@{$self->id_chars()}[3] >= 97) && (@{$self->id_chars()}[3] <= 122)) )) ;
    return $self->{is_unregistered_tag};
}

sub id_chars {
    my ($self) = @_;
    return $self->{id_chars} if ($self->{id_chars});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->chunk_ofs());
    $self->{id_chars} = $self->{_io}->read_bytes(4);
    $self->{_io}->seek($_pos);
    return $self->{id_chars};
}

sub chunk_id_readable {
    my ($self) = @_;
    return $self->{chunk_id_readable} if ($self->{chunk_id_readable});
    $self->{chunk_id_readable} = Encode::decode("ASCII", $self->id_chars());
    return $self->{chunk_id_readable};
}

sub chunk_ofs {
    my ($self) = @_;
    return $self->{chunk_ofs} if ($self->{chunk_ofs});
    $self->{chunk_ofs} = $self->_io()->pos();
    return $self->{chunk_ofs};
}

sub save_chunk_ofs {
    my ($self) = @_;
    return $self->{save_chunk_ofs};
}

sub chunk {
    my ($self) = @_;
    return $self->{chunk};
}

########################################################################
package Riff::ChunkType;

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

    if ($self->chunk_ofs() < 0) {
        $self->{save_chunk_ofs} = $self->{_io}->read_bytes(0);
    }
    $self->{chunk} = Riff::Chunk->new($self->{_io}, $self, $self->{_root});
}

sub chunk_ofs {
    my ($self) = @_;
    return $self->{chunk_ofs} if ($self->{chunk_ofs});
    $self->{chunk_ofs} = $self->_io()->pos();
    return $self->{chunk_ofs};
}

sub chunk_id {
    my ($self) = @_;
    return $self->{chunk_id} if ($self->{chunk_id});
    $self->{chunk_id} = $self->chunk()->id();
    return $self->{chunk_id};
}

sub chunk_id_readable {
    my ($self) = @_;
    return $self->{chunk_id_readable} if ($self->{chunk_id_readable});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->chunk_ofs());
    $self->{chunk_id_readable} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{_io}->seek($_pos);
    return $self->{chunk_id_readable};
}

sub chunk_data {
    my ($self) = @_;
    return $self->{chunk_data} if ($self->{chunk_data});
    my $io = $self->chunk()->data_slot()->_io();
    my $_pos = $io->pos();
    $io->seek(0);
    my $_on = $self->chunk_id();
    if ($_on == $Riff::FOURCC_LIST) {
        $self->{chunk_data} = Riff::ListChunkData->new($io, $self, $self->{_root});
    }
    $io->seek($_pos);
    return $self->{chunk_data};
}

sub save_chunk_ofs {
    my ($self) = @_;
    return $self->{save_chunk_ofs};
}

sub chunk {
    my ($self) = @_;
    return $self->{chunk};
}

1;
