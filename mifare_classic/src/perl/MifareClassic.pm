# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package MifareClassic;

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

    $self->{_raw_sectors} = ();
    $self->{sectors} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{_raw_sectors}}, $self->{_io}->read_bytes(((($i >= 32 ? 4 : 1) * 4) * 16));
        my $io__raw_sectors = IO::KaitaiStruct::Stream->new($self->{_raw_sectors}[-1]);
        push @{$self->{sectors}}, MifareClassic::Sector->new($io__raw_sectors, $self, $self->{_root});
    }
}

sub sectors {
    my ($self) = @_;
    return $self->{sectors};
}

sub _raw_sectors {
    my ($self) = @_;
    return $self->{_raw_sectors};
}

########################################################################
package MifareClassic::Key;

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

    $self->{key} = $self->{_io}->read_bytes(6);
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

########################################################################
package MifareClassic::Sector;

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

    if ($self->has_manufacturer()) {
        $self->{manufacturer} = MifareClassic::Manufacturer->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_raw_data_filler} = $self->{_io}->read_bytes((($self->_io()->size() - $self->_io()->pos()) - 16));
    my $io__raw_data_filler = IO::KaitaiStruct::Stream->new($self->{_raw_data_filler});
    $self->{data_filler} = MifareClassic::Sector::Filler->new($io__raw_data_filler, $self, $self->{_root});
    $self->{trailer} = MifareClassic::Trailer->new($self->{_io}, $self, $self->{_root});
}

sub block_size {
    my ($self) = @_;
    return $self->{block_size} if ($self->{block_size});
    $self->{block_size} = 16;
    return $self->{block_size};
}

sub data {
    my ($self) = @_;
    return $self->{data} if ($self->{data});
    $self->{data} = $self->data_filler()->data();
    return $self->{data};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks} if ($self->{blocks});
    my $io = $self->data_filler()->_io();
    my $_pos = $io->pos();
    $io->seek(0);
    $self->{blocks} = ();
    while (!$io->is_eof()) {
        push @{$self->{blocks}}, $io->read_bytes($self->block_size());
    }
    $io->seek($_pos);
    return $self->{blocks};
}

sub values {
    my ($self) = @_;
    return $self->{values} if ($self->{values});
    my $io = $self->data_filler()->_io();
    my $_pos = $io->pos();
    $io->seek(0);
    $self->{values} = MifareClassic::Sector::Values->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{values};
}

sub manufacturer {
    my ($self) = @_;
    return $self->{manufacturer};
}

sub data_filler {
    my ($self) = @_;
    return $self->{data_filler};
}

sub trailer {
    my ($self) = @_;
    return $self->{trailer};
}

sub has_manufacturer {
    my ($self) = @_;
    return $self->{has_manufacturer};
}

sub _raw_data_filler {
    my ($self) = @_;
    return $self->{_raw_data_filler};
}

########################################################################
package MifareClassic::Sector::Values;

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

    $self->{values} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{values}}, MifareClassic::Sector::Values::ValueBlock->new($self->{_io}, $self, $self->{_root});
    }
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

########################################################################
package MifareClassic::Sector::Values::ValueBlock;

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

    $self->{valuez} = ();
    my $n_valuez = 3;
    for (my $i = 0; $i < $n_valuez; $i++) {
        push @{$self->{valuez}}, $self->{_io}->read_u4le();
    }
    $self->{addrz} = ();
    my $n_addrz = 4;
    for (my $i = 0; $i < $n_addrz; $i++) {
        push @{$self->{addrz}}, $self->{_io}->read_u1();
    }
}

sub addr {
    my ($self) = @_;
    return $self->{addr} if ($self->{addr});
    if ($self->valid()) {
        $self->{addr} = @{$self->addrz()}[0];
    }
    return $self->{addr};
}

sub addr_valid {
    my ($self) = @_;
    return $self->{addr_valid} if ($self->{addr_valid});
    $self->{addr_valid} =  ((@{$self->addrz()}[0] == ~(@{$self->addrz()}[1])) && (@{$self->addrz()}[0] == @{$self->addrz()}[2]) && (@{$self->addrz()}[1] == @{$self->addrz()}[3])) ;
    return $self->{addr_valid};
}

sub valid {
    my ($self) = @_;
    return $self->{valid} if ($self->{valid});
    $self->{valid} =  (($self->value_valid()) && ($self->addr_valid())) ;
    return $self->{valid};
}

sub value_valid {
    my ($self) = @_;
    return $self->{value_valid} if ($self->{value_valid});
    $self->{value_valid} =  ((@{$self->valuez()}[0] == ~(@{$self->valuez()}[1])) && (@{$self->valuez()}[0] == @{$self->valuez()}[2])) ;
    return $self->{value_valid};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    if ($self->valid()) {
        $self->{value} = @{$self->valuez()}[0];
    }
    return $self->{value};
}

sub valuez {
    my ($self) = @_;
    return $self->{valuez};
}

sub addrz {
    my ($self) = @_;
    return $self->{addrz};
}

########################################################################
package MifareClassic::Sector::Filler;

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

    $self->{data} = $self->{_io}->read_bytes($self->_io()->size());
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package MifareClassic::Manufacturer;

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

    $self->{nuid} = $self->{_io}->read_u4le();
    $self->{bcc} = $self->{_io}->read_u1();
    $self->{sak} = $self->{_io}->read_u1();
    $self->{atqa} = $self->{_io}->read_u2le();
    $self->{manufacturer} = $self->{_io}->read_bytes(8);
}

sub nuid {
    my ($self) = @_;
    return $self->{nuid};
}

sub bcc {
    my ($self) = @_;
    return $self->{bcc};
}

sub sak {
    my ($self) = @_;
    return $self->{sak};
}

sub atqa {
    my ($self) = @_;
    return $self->{atqa};
}

sub manufacturer {
    my ($self) = @_;
    return $self->{manufacturer};
}

########################################################################
package MifareClassic::Trailer;

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

    $self->{key_a} = MifareClassic::Key->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_access_bits} = $self->{_io}->read_bytes(3);
    my $io__raw_access_bits = IO::KaitaiStruct::Stream->new($self->{_raw_access_bits});
    $self->{access_bits} = MifareClassic::Trailer::AccessConditions->new($io__raw_access_bits, $self, $self->{_root});
    $self->{user_byte} = $self->{_io}->read_u1();
    $self->{key_b} = MifareClassic::Key->new($self->{_io}, $self, $self->{_root});
}

sub ac_bits {
    my ($self) = @_;
    return $self->{ac_bits} if ($self->{ac_bits});
    $self->{ac_bits} = 3;
    return $self->{ac_bits};
}

sub acs_in_sector {
    my ($self) = @_;
    return $self->{acs_in_sector} if ($self->{acs_in_sector});
    $self->{acs_in_sector} = 4;
    return $self->{acs_in_sector};
}

sub ac_count_of_chunks {
    my ($self) = @_;
    return $self->{ac_count_of_chunks} if ($self->{ac_count_of_chunks});
    $self->{ac_count_of_chunks} = ($self->ac_bits() * 2);
    return $self->{ac_count_of_chunks};
}

sub key_a {
    my ($self) = @_;
    return $self->{key_a};
}

sub access_bits {
    my ($self) = @_;
    return $self->{access_bits};
}

sub user_byte {
    my ($self) = @_;
    return $self->{user_byte};
}

sub key_b {
    my ($self) = @_;
    return $self->{key_b};
}

sub _raw_access_bits {
    my ($self) = @_;
    return $self->{_raw_access_bits};
}

########################################################################
package MifareClassic::Trailer::AccessConditions;

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

    $self->{raw_chunks} = ();
    my $n_raw_chunks = $self->_parent()->ac_count_of_chunks();
    for (my $i = 0; $i < $n_raw_chunks; $i++) {
        push @{$self->{raw_chunks}}, $self->{_io}->read_bits_int_be(4);
    }
}

sub data_acs {
    my ($self) = @_;
    return $self->{data_acs} if ($self->{data_acs});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{data_acs} = ();
    my $n_data_acs = ($self->_parent()->acs_in_sector() - 1);
    for (my $i = 0; $i < $n_data_acs; $i++) {
        push @{$self->{data_acs}}, MifareClassic::Trailer::AccessConditions::DataAc->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{data_acs};
}

sub remaps {
    my ($self) = @_;
    return $self->{remaps} if ($self->{remaps});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{remaps} = ();
    my $n_remaps = $self->_parent()->ac_bits();
    for (my $i = 0; $i < $n_remaps; $i++) {
        push @{$self->{remaps}}, MifareClassic::Trailer::AccessConditions::ChunkBitRemap->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{remaps};
}

sub acs_raw {
    my ($self) = @_;
    return $self->{acs_raw} if ($self->{acs_raw});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{acs_raw} = ();
    my $n_acs_raw = $self->_parent()->acs_in_sector();
    for (my $i = 0; $i < $n_acs_raw; $i++) {
        push @{$self->{acs_raw}}, MifareClassic::Trailer::AccessConditions::Ac->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{acs_raw};
}

sub trailer_ac {
    my ($self) = @_;
    return $self->{trailer_ac} if ($self->{trailer_ac});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{trailer_ac} = MifareClassic::Trailer::AccessConditions::TrailerAc->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{trailer_ac};
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks} if ($self->{chunks});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{chunks} = ();
    my $n_chunks = $self->_parent()->ac_bits();
    for (my $i = 0; $i < $n_chunks; $i++) {
        push @{$self->{chunks}}, MifareClassic::Trailer::AccessConditions::ValidChunk->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{chunks};
}

sub raw_chunks {
    my ($self) = @_;
    return $self->{raw_chunks};
}

########################################################################
package MifareClassic::Trailer::AccessConditions::TrailerAc;

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

sub can_read_key_b {
    my ($self) = @_;
    return $self->{can_read_key_b} if ($self->{can_read_key_b});
    $self->{can_read_key_b} = $self->ac()->inv_shift_val() <= 2;
    return $self->{can_read_key_b};
}

sub can_write_keys {
    my ($self) = @_;
    return $self->{can_write_keys} if ($self->{can_write_keys});
    $self->{can_write_keys} =  (((($self->ac()->inv_shift_val() + 1) % 3) != 0) && ($self->ac()->inv_shift_val() < 6)) ;
    return $self->{can_write_keys};
}

sub can_write_access_bits {
    my ($self) = @_;
    return $self->{can_write_access_bits} if ($self->{can_write_access_bits});
    $self->{can_write_access_bits} = @{$self->ac()->bits()}[2]->b();
    return $self->{can_write_access_bits};
}

sub key_b_controls_write {
    my ($self) = @_;
    return $self->{key_b_controls_write} if ($self->{key_b_controls_write});
    $self->{key_b_controls_write} = !($self->can_read_key_b());
    return $self->{key_b_controls_write};
}

sub ac {
    my ($self) = @_;
    return $self->{ac};
}

########################################################################
package MifareClassic::Trailer::AccessConditions::ChunkBitRemap;

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

sub shift_value {
    my ($self) = @_;
    return $self->{shift_value} if ($self->{shift_value});
    $self->{shift_value} = ($self->bit_no() == 1 ? -1 : 1);
    return $self->{shift_value};
}

sub chunk_no {
    my ($self) = @_;
    return $self->{chunk_no} if ($self->{chunk_no});
    $self->{chunk_no} = ((($self->inv_chunk_no() + $self->shift_value()) + $self->_parent()->_parent()->ac_count_of_chunks()) % $self->_parent()->_parent()->ac_count_of_chunks());
    return $self->{chunk_no};
}

sub inv_chunk_no {
    my ($self) = @_;
    return $self->{inv_chunk_no} if ($self->{inv_chunk_no});
    $self->{inv_chunk_no} = ($self->bit_no() + $self->shift_value());
    return $self->{inv_chunk_no};
}

sub bit_no {
    my ($self) = @_;
    return $self->{bit_no};
}

########################################################################
package MifareClassic::Trailer::AccessConditions::DataAc;

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

sub read_key_a_required {
    my ($self) = @_;
    return $self->{read_key_a_required} if ($self->{read_key_a_required});
    $self->{read_key_a_required} = $self->ac()->val() <= 4;
    return $self->{read_key_a_required};
}

sub write_key_b_required {
    my ($self) = @_;
    return $self->{write_key_b_required} if ($self->{write_key_b_required});
    $self->{write_key_b_required} =  (( ((!($self->read_key_a_required())) || ($self->read_key_b_required())) ) && (!(@{$self->ac()->bits()}[0]->b()))) ;
    return $self->{write_key_b_required};
}

sub write_key_a_required {
    my ($self) = @_;
    return $self->{write_key_a_required} if ($self->{write_key_a_required});
    $self->{write_key_a_required} = $self->ac()->val() == 0;
    return $self->{write_key_a_required};
}

sub read_key_b_required {
    my ($self) = @_;
    return $self->{read_key_b_required} if ($self->{read_key_b_required});
    $self->{read_key_b_required} = $self->ac()->val() <= 6;
    return $self->{read_key_b_required};
}

sub decrement_available {
    my ($self) = @_;
    return $self->{decrement_available} if ($self->{decrement_available});
    $self->{decrement_available} =  (( ((@{$self->ac()->bits()}[1]->b()) || (!(@{$self->ac()->bits()}[0]->b()))) ) && (!(@{$self->ac()->bits()}[2]->b()))) ;
    return $self->{decrement_available};
}

sub increment_available {
    my ($self) = @_;
    return $self->{increment_available} if ($self->{increment_available});
    $self->{increment_available} =  (( ((!(@{$self->ac()->bits()}[0]->b())) && (!($self->read_key_a_required())) && (!($self->read_key_b_required()))) ) || ( ((!(@{$self->ac()->bits()}[0]->b())) && ($self->read_key_a_required()) && ($self->read_key_b_required())) )) ;
    return $self->{increment_available};
}

sub ac {
    my ($self) = @_;
    return $self->{ac};
}

########################################################################
package MifareClassic::Trailer::AccessConditions::Ac;

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

sub bits {
    my ($self) = @_;
    return $self->{bits} if ($self->{bits});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{bits} = ();
    my $n_bits = $self->_parent()->_parent()->ac_bits();
    for (my $i = 0; $i < $n_bits; $i++) {
        push @{$self->{bits}}, MifareClassic::Trailer::AccessConditions::Ac::AcBit->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{bits};
}

sub val {
    my ($self) = @_;
    return $self->{val} if ($self->{val});
    $self->{val} = (((@{$self->bits()}[2]->n() << 2) | (@{$self->bits()}[1]->n() << 1)) | @{$self->bits()}[0]->n());
    return $self->{val};
}

sub inv_shift_val {
    my ($self) = @_;
    return $self->{inv_shift_val} if ($self->{inv_shift_val});
    $self->{inv_shift_val} = (((@{$self->bits()}[0]->n() << 2) | (@{$self->bits()}[1]->n() << 1)) | @{$self->bits()}[2]->n());
    return $self->{inv_shift_val};
}

sub index {
    my ($self) = @_;
    return $self->{index};
}

########################################################################
package MifareClassic::Trailer::AccessConditions::Ac::AcBit;

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

sub n {
    my ($self) = @_;
    return $self->{n} if ($self->{n});
    $self->{n} = (($self->chunk() >> $self->i()) & 1);
    return $self->{n};
}

sub b {
    my ($self) = @_;
    return $self->{b} if ($self->{b});
    $self->{b} = $self->n() == 1;
    return $self->{b};
}

sub i {
    my ($self) = @_;
    return $self->{i};
}

sub chunk {
    my ($self) = @_;
    return $self->{chunk};
}

########################################################################
package MifareClassic::Trailer::AccessConditions::ValidChunk;

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

sub valid {
    my ($self) = @_;
    return $self->{valid} if ($self->{valid});
    $self->{valid} = ($self->inv_chunk() ^ $self->chunk()) == 15;
    return $self->{valid};
}

sub inv_chunk {
    my ($self) = @_;
    return $self->{inv_chunk};
}

sub chunk {
    my ($self) = @_;
    return $self->{chunk};
}

1;
