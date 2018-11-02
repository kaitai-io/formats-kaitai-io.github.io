# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;
use VlqBase128Be;

########################################################################
package Sqlite3;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $VERSIONS_LEGACY = 1;
our $VERSIONS_WAL = 2;

our $ENCODINGS_UTF_8 = 1;
our $ENCODINGS_UTF_16LE = 2;
our $ENCODINGS_UTF_16BE = 3;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (83, 81, 76, 105, 116, 101, 32, 102, 111, 114, 109, 97, 116, 32, 51, 0)));
    $self->{len_page_mod} = $self->{_io}->read_u2be();
    $self->{write_version} = $self->{_io}->read_u1();
    $self->{read_version} = $self->{_io}->read_u1();
    $self->{reserved_space} = $self->{_io}->read_u1();
    $self->{max_payload_frac} = $self->{_io}->read_u1();
    $self->{min_payload_frac} = $self->{_io}->read_u1();
    $self->{leaf_payload_frac} = $self->{_io}->read_u1();
    $self->{file_change_counter} = $self->{_io}->read_u4be();
    $self->{num_pages} = $self->{_io}->read_u4be();
    $self->{first_freelist_trunk_page} = $self->{_io}->read_u4be();
    $self->{num_freelist_pages} = $self->{_io}->read_u4be();
    $self->{schema_cookie} = $self->{_io}->read_u4be();
    $self->{schema_format} = $self->{_io}->read_u4be();
    $self->{def_page_cache_size} = $self->{_io}->read_u4be();
    $self->{largest_root_page} = $self->{_io}->read_u4be();
    $self->{text_encoding} = $self->{_io}->read_u4be();
    $self->{user_version} = $self->{_io}->read_u4be();
    $self->{is_incremental_vacuum} = $self->{_io}->read_u4be();
    $self->{application_id} = $self->{_io}->read_u4be();
    $self->{reserved} = $self->{_io}->read_bytes(20);
    $self->{version_valid_for} = $self->{_io}->read_u4be();
    $self->{sqlite_version_number} = $self->{_io}->read_u4be();
    $self->{root_page} = Sqlite3::BtreePage->new($self->{_io}, $self, $self->{_root});
}

sub len_page {
    my ($self) = @_;
    return $self->{len_page} if ($self->{len_page});
    $self->{len_page} = ($self->len_page_mod() == 1 ? 65536 : $self->len_page_mod());
    return $self->{len_page};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub len_page_mod {
    my ($self) = @_;
    return $self->{len_page_mod};
}

sub write_version {
    my ($self) = @_;
    return $self->{write_version};
}

sub read_version {
    my ($self) = @_;
    return $self->{read_version};
}

sub reserved_space {
    my ($self) = @_;
    return $self->{reserved_space};
}

sub max_payload_frac {
    my ($self) = @_;
    return $self->{max_payload_frac};
}

sub min_payload_frac {
    my ($self) = @_;
    return $self->{min_payload_frac};
}

sub leaf_payload_frac {
    my ($self) = @_;
    return $self->{leaf_payload_frac};
}

sub file_change_counter {
    my ($self) = @_;
    return $self->{file_change_counter};
}

sub num_pages {
    my ($self) = @_;
    return $self->{num_pages};
}

sub first_freelist_trunk_page {
    my ($self) = @_;
    return $self->{first_freelist_trunk_page};
}

sub num_freelist_pages {
    my ($self) = @_;
    return $self->{num_freelist_pages};
}

sub schema_cookie {
    my ($self) = @_;
    return $self->{schema_cookie};
}

sub schema_format {
    my ($self) = @_;
    return $self->{schema_format};
}

sub def_page_cache_size {
    my ($self) = @_;
    return $self->{def_page_cache_size};
}

sub largest_root_page {
    my ($self) = @_;
    return $self->{largest_root_page};
}

sub text_encoding {
    my ($self) = @_;
    return $self->{text_encoding};
}

sub user_version {
    my ($self) = @_;
    return $self->{user_version};
}

sub is_incremental_vacuum {
    my ($self) = @_;
    return $self->{is_incremental_vacuum};
}

sub application_id {
    my ($self) = @_;
    return $self->{application_id};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub version_valid_for {
    my ($self) = @_;
    return $self->{version_valid_for};
}

sub sqlite_version_number {
    my ($self) = @_;
    return $self->{sqlite_version_number};
}

sub root_page {
    my ($self) = @_;
    return $self->{root_page};
}

########################################################################
package Sqlite3::Serial;

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

    $self->{code} = VlqBase128Be->new($self->{_io});
}

sub is_blob {
    my ($self) = @_;
    return $self->{is_blob} if ($self->{is_blob});
    $self->{is_blob} =  (($self->code()->value() >= 12) && (($self->code()->value() % 2) == 0)) ;
    return $self->{is_blob};
}

sub is_string {
    my ($self) = @_;
    return $self->{is_string} if ($self->{is_string});
    $self->{is_string} =  (($self->code()->value() >= 13) && (($self->code()->value() % 2) == 1)) ;
    return $self->{is_string};
}

sub len_content {
    my ($self) = @_;
    return $self->{len_content} if ($self->{len_content});
    if ($self->code()->value() >= 12) {
        $self->{len_content} = int(($self->code()->value() - 12) / 2);
    }
    return $self->{len_content};
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

########################################################################
package Sqlite3::BtreePage;

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

    $self->{page_type} = $self->{_io}->read_u1();
    $self->{first_freeblock} = $self->{_io}->read_u2be();
    $self->{num_cells} = $self->{_io}->read_u2be();
    $self->{ofs_cells} = $self->{_io}->read_u2be();
    $self->{num_frag_free_bytes} = $self->{_io}->read_u1();
    if ( (($self->page_type() == 2) || ($self->page_type() == 5)) ) {
        $self->{right_ptr} = $self->{_io}->read_u4be();
    }
    $self->{cells} = ();
    my $n_cells = $self->num_cells();
    for (my $i = 0; $i < $n_cells; $i++) {
        $self->{cells}[$i] = Sqlite3::RefCell->new($self->{_io}, $self, $self->{_root});
    }
}

sub page_type {
    my ($self) = @_;
    return $self->{page_type};
}

sub first_freeblock {
    my ($self) = @_;
    return $self->{first_freeblock};
}

sub num_cells {
    my ($self) = @_;
    return $self->{num_cells};
}

sub ofs_cells {
    my ($self) = @_;
    return $self->{ofs_cells};
}

sub num_frag_free_bytes {
    my ($self) = @_;
    return $self->{num_frag_free_bytes};
}

sub right_ptr {
    my ($self) = @_;
    return $self->{right_ptr};
}

sub cells {
    my ($self) = @_;
    return $self->{cells};
}

########################################################################
package Sqlite3::CellIndexLeaf;

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

    $self->{len_payload} = VlqBase128Be->new($self->{_io});
    $self->{_raw_payload} = $self->{_io}->read_bytes($self->len_payload()->value());
    my $io__raw_payload = IO::KaitaiStruct::Stream->new($self->{_raw_payload});
    $self->{payload} = Sqlite3::CellPayload->new($io__raw_payload, $self, $self->{_root});
}

sub len_payload {
    my ($self) = @_;
    return $self->{len_payload};
}

sub payload {
    my ($self) = @_;
    return $self->{payload};
}

sub _raw_payload {
    my ($self) = @_;
    return $self->{_raw_payload};
}

########################################################################
package Sqlite3::Serials;

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
        push @{$self->{entries}}, VlqBase128Be->new($self->{_io});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Sqlite3::CellTableLeaf;

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

    $self->{len_payload} = VlqBase128Be->new($self->{_io});
    $self->{row_id} = VlqBase128Be->new($self->{_io});
    $self->{_raw_payload} = $self->{_io}->read_bytes($self->len_payload()->value());
    my $io__raw_payload = IO::KaitaiStruct::Stream->new($self->{_raw_payload});
    $self->{payload} = Sqlite3::CellPayload->new($io__raw_payload, $self, $self->{_root});
}

sub len_payload {
    my ($self) = @_;
    return $self->{len_payload};
}

sub row_id {
    my ($self) = @_;
    return $self->{row_id};
}

sub payload {
    my ($self) = @_;
    return $self->{payload};
}

sub _raw_payload {
    my ($self) = @_;
    return $self->{_raw_payload};
}

########################################################################
package Sqlite3::CellPayload;

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

    $self->{len_header_and_len} = VlqBase128Be->new($self->{_io});
    $self->{_raw_column_serials} = $self->{_io}->read_bytes(($self->len_header_and_len()->value() - 1));
    my $io__raw_column_serials = IO::KaitaiStruct::Stream->new($self->{_raw_column_serials});
    $self->{column_serials} = Sqlite3::Serials->new($io__raw_column_serials, $self, $self->{_root});
    $self->{column_contents} = ();
    my $n_column_contents = scalar(@{$self->column_serials()->entries()});
    for (my $i = 0; $i < $n_column_contents; $i++) {
        $self->{column_contents}[$i] = Sqlite3::ColumnContent->new($self->{_io}, $self, $self->{_root});
    }
}

sub len_header_and_len {
    my ($self) = @_;
    return $self->{len_header_and_len};
}

sub column_serials {
    my ($self) = @_;
    return $self->{column_serials};
}

sub column_contents {
    my ($self) = @_;
    return $self->{column_contents};
}

sub _raw_column_serials {
    my ($self) = @_;
    return $self->{_raw_column_serials};
}

########################################################################
package Sqlite3::CellTableInterior;

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

    $self->{left_child_page} = $self->{_io}->read_u4be();
    $self->{row_id} = VlqBase128Be->new($self->{_io});
}

sub left_child_page {
    my ($self) = @_;
    return $self->{left_child_page};
}

sub row_id {
    my ($self) = @_;
    return $self->{row_id};
}

########################################################################
package Sqlite3::CellIndexInterior;

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

    $self->{left_child_page} = $self->{_io}->read_u4be();
    $self->{len_payload} = VlqBase128Be->new($self->{_io});
    $self->{_raw_payload} = $self->{_io}->read_bytes($self->len_payload()->value());
    my $io__raw_payload = IO::KaitaiStruct::Stream->new($self->{_raw_payload});
    $self->{payload} = Sqlite3::CellPayload->new($io__raw_payload, $self, $self->{_root});
}

sub left_child_page {
    my ($self) = @_;
    return $self->{left_child_page};
}

sub len_payload {
    my ($self) = @_;
    return $self->{len_payload};
}

sub payload {
    my ($self) = @_;
    return $self->{payload};
}

sub _raw_payload {
    my ($self) = @_;
    return $self->{_raw_payload};
}

########################################################################
package Sqlite3::ColumnContent;

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

    if ( (($self->serial_type()->code()->value() >= 1) && ($self->serial_type()->code()->value() <= 6)) ) {
        my $_on = $self->serial_type()->code()->value();
        if ($_on == 4) {
            $self->{as_int} = $self->{_io}->read_u4be();
        }
        elsif ($_on == 6) {
            $self->{as_int} = $self->{_io}->read_u8be();
        }
        elsif ($_on == 1) {
            $self->{as_int} = $self->{_io}->read_u1();
        }
        elsif ($_on == 3) {
            $self->{as_int} = $self->{_io}->read_bits_int(24);
        }
        elsif ($_on == 5) {
            $self->{as_int} = $self->{_io}->read_bits_int(48);
        }
        elsif ($_on == 2) {
            $self->{as_int} = $self->{_io}->read_u2be();
        }
    }
    if ($self->serial_type()->code()->value() == 7) {
        $self->{as_float} = $self->{_io}->read_f8be();
    }
    if ($self->serial_type()->is_blob()) {
        $self->{as_blob} = $self->{_io}->read_bytes($self->serial_type()->len_content());
    }
    $self->{as_str} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->serial_type()->len_content()));
}

sub serial_type {
    my ($self) = @_;
    return $self->{serial_type} if ($self->{serial_type});
    $self->{serial_type} = $self->ser();
    return $self->{serial_type};
}

sub as_int {
    my ($self) = @_;
    return $self->{as_int};
}

sub as_float {
    my ($self) = @_;
    return $self->{as_float};
}

sub as_blob {
    my ($self) = @_;
    return $self->{as_blob};
}

sub as_str {
    my ($self) = @_;
    return $self->{as_str};
}

sub ser {
    my ($self) = @_;
    return $self->{ser};
}

########################################################################
package Sqlite3::RefCell;

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

    $self->{ofs_body} = $self->{_io}->read_u2be();
}

sub body {
    my ($self) = @_;
    return $self->{body} if ($self->{body});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_body());
    my $_on = $self->_parent()->page_type();
    if ($_on == 13) {
        $self->{body} = Sqlite3::CellTableLeaf->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 5) {
        $self->{body} = Sqlite3::CellTableInterior->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 10) {
        $self->{body} = Sqlite3::CellIndexLeaf->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 2) {
        $self->{body} = Sqlite3::CellIndexInterior->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{body};
}

sub ofs_body {
    my ($self) = @_;
    return $self->{ofs_body};
}

1;
