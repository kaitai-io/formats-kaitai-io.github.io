# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package TrDosImage;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DISK_TYPE_TYPE_80_TRACKS_DOUBLE_SIDE = 22;
our $DISK_TYPE_TYPE_40_TRACKS_DOUBLE_SIDE = 23;
our $DISK_TYPE_TYPE_80_TRACKS_SINGLE_SIDE = 24;
our $DISK_TYPE_TYPE_40_TRACKS_SINGLE_SIDE = 25;

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

    $self->{files} = [];
    {
        my $_it;
        do {
            $_it = TrDosImage::File->new($self->{_io}, $self, $self->{_root});
            push @{$self->{files}}, $_it;
        } until ($_it->is_terminator());
    }
}

sub volume_info {
    my ($self) = @_;
    return $self->{volume_info} if ($self->{volume_info});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(2048);
    $self->{volume_info} = TrDosImage::VolumeInfo->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{volume_info};
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

########################################################################
package TrDosImage::File;

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

    $self->{_raw_name} = $self->{_io}->read_bytes(8);
    my $io__raw_name = IO::KaitaiStruct::Stream->new($self->{_raw_name});
    $self->{name} = TrDosImage::Filename->new($io__raw_name, $self, $self->{_root});
    $self->{extension} = $self->{_io}->read_u1();
    my $_on = $self->extension();
    if ($_on == 35) {
        $self->{position_and_length} = TrDosImage::PositionAndLengthPrint->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 66) {
        $self->{position_and_length} = TrDosImage::PositionAndLengthBasic->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 67) {
        $self->{position_and_length} = TrDosImage::PositionAndLengthCode->new($self->{_io}, $self, $self->{_root});
    }
    else {
        $self->{position_and_length} = TrDosImage::PositionAndLengthGeneric->new($self->{_io}, $self, $self->{_root});
    }
    $self->{length_sectors} = $self->{_io}->read_u1();
    $self->{starting_sector} = $self->{_io}->read_u1();
    $self->{starting_track} = $self->{_io}->read_u1();
}

sub contents {
    my ($self) = @_;
    return $self->{contents} if ($self->{contents});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(($self->starting_track() * 256) * 16 + $self->starting_sector() * 256);
    $self->{contents} = $self->{_io}->read_bytes($self->length_sectors() * 256);
    $self->{_io}->seek($_pos);
    return $self->{contents};
}

sub is_deleted {
    my ($self) = @_;
    return $self->{is_deleted} if ($self->{is_deleted});
    $self->{is_deleted} = $self->name()->first_byte() == 1;
    return $self->{is_deleted};
}

sub is_terminator {
    my ($self) = @_;
    return $self->{is_terminator} if ($self->{is_terminator});
    $self->{is_terminator} = $self->name()->first_byte() == 0;
    return $self->{is_terminator};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub extension {
    my ($self) = @_;
    return $self->{extension};
}

sub position_and_length {
    my ($self) = @_;
    return $self->{position_and_length};
}

sub length_sectors {
    my ($self) = @_;
    return $self->{length_sectors};
}

sub starting_sector {
    my ($self) = @_;
    return $self->{starting_sector};
}

sub starting_track {
    my ($self) = @_;
    return $self->{starting_track};
}

sub _raw_name {
    my ($self) = @_;
    return $self->{_raw_name};
}

########################################################################
package TrDosImage::Filename;

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

    $self->{name} = $self->{_io}->read_bytes(8);
}

sub first_byte {
    my ($self) = @_;
    return $self->{first_byte} if ($self->{first_byte});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{first_byte} = $self->{_io}->read_u1();
    $self->{_io}->seek($_pos);
    return $self->{first_byte};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

########################################################################
package TrDosImage::PositionAndLengthBasic;

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

    $self->{program_and_data_length} = $self->{_io}->read_u2le();
    $self->{program_length} = $self->{_io}->read_u2le();
}

sub program_and_data_length {
    my ($self) = @_;
    return $self->{program_and_data_length};
}

sub program_length {
    my ($self) = @_;
    return $self->{program_length};
}

########################################################################
package TrDosImage::PositionAndLengthCode;

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

    $self->{start_address} = $self->{_io}->read_u2le();
    $self->{length} = $self->{_io}->read_u2le();
}

sub start_address {
    my ($self) = @_;
    return $self->{start_address};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

########################################################################
package TrDosImage::PositionAndLengthGeneric;

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

    $self->{reserved} = $self->{_io}->read_u2le();
    $self->{length} = $self->{_io}->read_u2le();
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

########################################################################
package TrDosImage::PositionAndLengthPrint;

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

    $self->{extent_no} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_u1();
    $self->{length} = $self->{_io}->read_u2le();
}

sub extent_no {
    my ($self) = @_;
    return $self->{extent_no};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

########################################################################
package TrDosImage::VolumeInfo;

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

    $self->{catalog_end} = $self->{_io}->read_bytes(1);
    $self->{unused} = $self->{_io}->read_bytes(224);
    $self->{first_free_sector_sector} = $self->{_io}->read_u1();
    $self->{first_free_sector_track} = $self->{_io}->read_u1();
    $self->{disk_type} = $self->{_io}->read_u1();
    $self->{num_files} = $self->{_io}->read_u1();
    $self->{num_free_sectors} = $self->{_io}->read_u2le();
    $self->{tr_dos_id} = $self->{_io}->read_bytes(1);
    $self->{unused_2} = $self->{_io}->read_bytes(2);
    $self->{password} = $self->{_io}->read_bytes(9);
    $self->{unused_3} = $self->{_io}->read_bytes(1);
    $self->{num_deleted_files} = $self->{_io}->read_u1();
    $self->{label} = $self->{_io}->read_bytes(8);
    $self->{unused_4} = $self->{_io}->read_bytes(3);
}

sub num_sides {
    my ($self) = @_;
    return $self->{num_sides} if ($self->{num_sides});
    $self->{num_sides} = (($self->disk_type() & 8) != 0 ? 1 : 2);
    return $self->{num_sides};
}

sub num_tracks {
    my ($self) = @_;
    return $self->{num_tracks} if ($self->{num_tracks});
    $self->{num_tracks} = (($self->disk_type() & 1) != 0 ? 40 : 80);
    return $self->{num_tracks};
}

sub catalog_end {
    my ($self) = @_;
    return $self->{catalog_end};
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

sub first_free_sector_sector {
    my ($self) = @_;
    return $self->{first_free_sector_sector};
}

sub first_free_sector_track {
    my ($self) = @_;
    return $self->{first_free_sector_track};
}

sub disk_type {
    my ($self) = @_;
    return $self->{disk_type};
}

sub num_files {
    my ($self) = @_;
    return $self->{num_files};
}

sub num_free_sectors {
    my ($self) = @_;
    return $self->{num_free_sectors};
}

sub tr_dos_id {
    my ($self) = @_;
    return $self->{tr_dos_id};
}

sub unused_2 {
    my ($self) = @_;
    return $self->{unused_2};
}

sub password {
    my ($self) = @_;
    return $self->{password};
}

sub unused_3 {
    my ($self) = @_;
    return $self->{unused_3};
}

sub num_deleted_files {
    my ($self) = @_;
    return $self->{num_deleted_files};
}

sub label {
    my ($self) = @_;
    return $self->{label};
}

sub unused_4 {
    my ($self) = @_;
    return $self->{unused_4};
}

1;
