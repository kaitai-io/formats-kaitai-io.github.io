# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Dbf;

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

    $self->{header1} = Dbf::Header1->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_header2} = $self->{_io}->read_bytes(($self->header1()->len_header() - 12));
    my $io__raw_header2 = IO::KaitaiStruct::Stream->new($self->{_raw_header2});
    $self->{header2} = Dbf::Header2->new($io__raw_header2, $self, $self->{_root});
    $self->{records} = ();
    my $n_records = $self->header1()->num_records();
    for (my $i = 0; $i < $n_records; $i++) {
        $self->{records}[$i] = $self->{_io}->read_bytes($self->header1()->len_record());
    }
}

sub header1 {
    my ($self) = @_;
    return $self->{header1};
}

sub header2 {
    my ($self) = @_;
    return $self->{header2};
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

sub _raw_header2 {
    my ($self) = @_;
    return $self->{_raw_header2};
}

########################################################################
package Dbf::Header2;

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

    if ($self->_root()->header1()->dbase_level() == 3) {
        $self->{header_dbase_3} = Dbf::HeaderDbase3->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->_root()->header1()->dbase_level() == 7) {
        $self->{header_dbase_7} = Dbf::HeaderDbase7->new($self->{_io}, $self, $self->{_root});
    }
    $self->{fields} = ();
    my $n_fields = 11;
    for (my $i = 0; $i < $n_fields; $i++) {
        $self->{fields}[$i] = Dbf::Field->new($self->{_io}, $self, $self->{_root});
    }
}

sub header_dbase_3 {
    my ($self) = @_;
    return $self->{header_dbase_3};
}

sub header_dbase_7 {
    my ($self) = @_;
    return $self->{header_dbase_7};
}

sub fields {
    my ($self) = @_;
    return $self->{fields};
}

########################################################################
package Dbf::Field;

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

    $self->{name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(11), 0, 0));
    $self->{datatype} = $self->{_io}->read_u1();
    $self->{data_address} = $self->{_io}->read_u4le();
    $self->{length} = $self->{_io}->read_u1();
    $self->{decimal_count} = $self->{_io}->read_u1();
    $self->{reserved1} = $self->{_io}->read_bytes(2);
    $self->{work_area_id} = $self->{_io}->read_u1();
    $self->{reserved2} = $self->{_io}->read_bytes(2);
    $self->{set_fields_flag} = $self->{_io}->read_u1();
    $self->{reserved3} = $self->{_io}->read_bytes(8);
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub datatype {
    my ($self) = @_;
    return $self->{datatype};
}

sub data_address {
    my ($self) = @_;
    return $self->{data_address};
}

sub length {
    my ($self) = @_;
    return $self->{length};
}

sub decimal_count {
    my ($self) = @_;
    return $self->{decimal_count};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub work_area_id {
    my ($self) = @_;
    return $self->{work_area_id};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub set_fields_flag {
    my ($self) = @_;
    return $self->{set_fields_flag};
}

sub reserved3 {
    my ($self) = @_;
    return $self->{reserved3};
}

########################################################################
package Dbf::Header1;

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

    $self->{version} = $self->{_io}->read_u1();
    $self->{last_update_y} = $self->{_io}->read_u1();
    $self->{last_update_m} = $self->{_io}->read_u1();
    $self->{last_update_d} = $self->{_io}->read_u1();
    $self->{num_records} = $self->{_io}->read_u4le();
    $self->{len_header} = $self->{_io}->read_u2le();
    $self->{len_record} = $self->{_io}->read_u2le();
}

sub dbase_level {
    my ($self) = @_;
    return $self->{dbase_level} if ($self->{dbase_level});
    $self->{dbase_level} = ($self->version() & 7);
    return $self->{dbase_level};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub last_update_y {
    my ($self) = @_;
    return $self->{last_update_y};
}

sub last_update_m {
    my ($self) = @_;
    return $self->{last_update_m};
}

sub last_update_d {
    my ($self) = @_;
    return $self->{last_update_d};
}

sub num_records {
    my ($self) = @_;
    return $self->{num_records};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub len_record {
    my ($self) = @_;
    return $self->{len_record};
}

########################################################################
package Dbf::HeaderDbase3;

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

    $self->{reserved1} = $self->{_io}->read_bytes(3);
    $self->{reserved2} = $self->{_io}->read_bytes(13);
    $self->{reserved3} = $self->{_io}->read_bytes(4);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub reserved3 {
    my ($self) = @_;
    return $self->{reserved3};
}

########################################################################
package Dbf::HeaderDbase7;

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

    $self->{reserved1} = $self->{_io}->read_bytes(2);
    $self->{has_incomplete_transaction} = $self->{_io}->read_u1();
    $self->{dbase_iv_encryption} = $self->{_io}->read_u1();
    $self->{reserved2} = $self->{_io}->read_bytes(12);
    $self->{production_mdx} = $self->{_io}->read_u1();
    $self->{language_driver_id} = $self->{_io}->read_u1();
    $self->{reserved3} = $self->{_io}->read_bytes(2);
    $self->{language_driver_name} = $self->{_io}->read_bytes(32);
    $self->{reserved4} = $self->{_io}->read_bytes(4);
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub has_incomplete_transaction {
    my ($self) = @_;
    return $self->{has_incomplete_transaction};
}

sub dbase_iv_encryption {
    my ($self) = @_;
    return $self->{dbase_iv_encryption};
}

sub reserved2 {
    my ($self) = @_;
    return $self->{reserved2};
}

sub production_mdx {
    my ($self) = @_;
    return $self->{production_mdx};
}

sub language_driver_id {
    my ($self) = @_;
    return $self->{language_driver_id};
}

sub reserved3 {
    my ($self) = @_;
    return $self->{reserved3};
}

sub language_driver_name {
    my ($self) = @_;
    return $self->{language_driver_name};
}

sub reserved4 {
    my ($self) = @_;
    return $self->{reserved4};
}

1;
