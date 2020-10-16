# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package SystemdJournal;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $STATE_OFFLINE = 0;
our $STATE_ONLINE = 1;
our $STATE_ARCHIVED = 2;

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

    $self->{_raw_header} = $self->{_io}->read_bytes($self->len_header());
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = SystemdJournal::Header->new($io__raw_header, $self, $self->{_root});
    $self->{objects} = ();
    my $n_objects = $self->header()->num_objects();
    for (my $i = 0; $i < $n_objects; $i++) {
        $self->{objects}[$i] = SystemdJournal::JournalObject->new($self->{_io}, $self, $self->{_root});
    }
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header} if ($self->{len_header});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(88);
    $self->{len_header} = $self->{_io}->read_u8le();
    $self->{_io}->seek($_pos);
    return $self->{len_header};
}

sub data_hash_table {
    my ($self) = @_;
    return $self->{data_hash_table} if ($self->{data_hash_table});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->ofs_data_hash_table());
    $self->{data_hash_table} = $self->{_io}->read_bytes($self->header()->len_data_hash_table());
    $self->{_io}->seek($_pos);
    return $self->{data_hash_table};
}

sub field_hash_table {
    my ($self) = @_;
    return $self->{field_hash_table} if ($self->{field_hash_table});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->header()->ofs_field_hash_table());
    $self->{field_hash_table} = $self->{_io}->read_bytes($self->header()->len_field_hash_table());
    $self->{_io}->seek($_pos);
    return $self->{field_hash_table};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub objects {
    my ($self) = @_;
    return $self->{objects};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package SystemdJournal::Header;

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

    $self->{signature} = $self->{_io}->read_bytes(8);
    $self->{compatible_flags} = $self->{_io}->read_u4le();
    $self->{incompatible_flags} = $self->{_io}->read_u4le();
    $self->{state} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_bytes(7);
    $self->{file_id} = $self->{_io}->read_bytes(16);
    $self->{machine_id} = $self->{_io}->read_bytes(16);
    $self->{boot_id} = $self->{_io}->read_bytes(16);
    $self->{seqnum_id} = $self->{_io}->read_bytes(16);
    $self->{len_header} = $self->{_io}->read_u8le();
    $self->{len_arena} = $self->{_io}->read_u8le();
    $self->{ofs_data_hash_table} = $self->{_io}->read_u8le();
    $self->{len_data_hash_table} = $self->{_io}->read_u8le();
    $self->{ofs_field_hash_table} = $self->{_io}->read_u8le();
    $self->{len_field_hash_table} = $self->{_io}->read_u8le();
    $self->{ofs_tail_object} = $self->{_io}->read_u8le();
    $self->{num_objects} = $self->{_io}->read_u8le();
    $self->{num_entries} = $self->{_io}->read_u8le();
    $self->{tail_entry_seqnum} = $self->{_io}->read_u8le();
    $self->{head_entry_seqnum} = $self->{_io}->read_u8le();
    $self->{ofs_entry_array} = $self->{_io}->read_u8le();
    $self->{head_entry_realtime} = $self->{_io}->read_u8le();
    $self->{tail_entry_realtime} = $self->{_io}->read_u8le();
    $self->{tail_entry_monotonic} = $self->{_io}->read_u8le();
    if (!($self->_io()->is_eof())) {
        $self->{num_data} = $self->{_io}->read_u8le();
    }
    if (!($self->_io()->is_eof())) {
        $self->{num_fields} = $self->{_io}->read_u8le();
    }
    if (!($self->_io()->is_eof())) {
        $self->{num_tags} = $self->{_io}->read_u8le();
    }
    if (!($self->_io()->is_eof())) {
        $self->{num_entry_arrays} = $self->{_io}->read_u8le();
    }
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub compatible_flags {
    my ($self) = @_;
    return $self->{compatible_flags};
}

sub incompatible_flags {
    my ($self) = @_;
    return $self->{incompatible_flags};
}

sub state {
    my ($self) = @_;
    return $self->{state};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub file_id {
    my ($self) = @_;
    return $self->{file_id};
}

sub machine_id {
    my ($self) = @_;
    return $self->{machine_id};
}

sub boot_id {
    my ($self) = @_;
    return $self->{boot_id};
}

sub seqnum_id {
    my ($self) = @_;
    return $self->{seqnum_id};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

sub len_arena {
    my ($self) = @_;
    return $self->{len_arena};
}

sub ofs_data_hash_table {
    my ($self) = @_;
    return $self->{ofs_data_hash_table};
}

sub len_data_hash_table {
    my ($self) = @_;
    return $self->{len_data_hash_table};
}

sub ofs_field_hash_table {
    my ($self) = @_;
    return $self->{ofs_field_hash_table};
}

sub len_field_hash_table {
    my ($self) = @_;
    return $self->{len_field_hash_table};
}

sub ofs_tail_object {
    my ($self) = @_;
    return $self->{ofs_tail_object};
}

sub num_objects {
    my ($self) = @_;
    return $self->{num_objects};
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries};
}

sub tail_entry_seqnum {
    my ($self) = @_;
    return $self->{tail_entry_seqnum};
}

sub head_entry_seqnum {
    my ($self) = @_;
    return $self->{head_entry_seqnum};
}

sub ofs_entry_array {
    my ($self) = @_;
    return $self->{ofs_entry_array};
}

sub head_entry_realtime {
    my ($self) = @_;
    return $self->{head_entry_realtime};
}

sub tail_entry_realtime {
    my ($self) = @_;
    return $self->{tail_entry_realtime};
}

sub tail_entry_monotonic {
    my ($self) = @_;
    return $self->{tail_entry_monotonic};
}

sub num_data {
    my ($self) = @_;
    return $self->{num_data};
}

sub num_fields {
    my ($self) = @_;
    return $self->{num_fields};
}

sub num_tags {
    my ($self) = @_;
    return $self->{num_tags};
}

sub num_entry_arrays {
    my ($self) = @_;
    return $self->{num_entry_arrays};
}

########################################################################
package SystemdJournal::JournalObject;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OBJECT_TYPES_UNUSED = 0;
our $OBJECT_TYPES_DATA = 1;
our $OBJECT_TYPES_FIELD = 2;
our $OBJECT_TYPES_ENTRY = 3;
our $OBJECT_TYPES_DATA_HASH_TABLE = 4;
our $OBJECT_TYPES_FIELD_HASH_TABLE = 5;
our $OBJECT_TYPES_ENTRY_ARRAY = 6;
our $OBJECT_TYPES_TAG = 7;

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

    $self->{padding} = $self->{_io}->read_bytes(((8 - $self->_io()->pos()) % 8));
    $self->{object_type} = $self->{_io}->read_u1();
    $self->{flags} = $self->{_io}->read_u1();
    $self->{reserved} = $self->{_io}->read_bytes(6);
    $self->{len_object} = $self->{_io}->read_u8le();
    my $_on = $self->object_type();
    if ($_on == $SystemdJournal::JournalObject::OBJECT_TYPES_DATA) {
        $self->{_raw_payload} = $self->{_io}->read_bytes(($self->len_object() - 16));
        my $io__raw_payload = IO::KaitaiStruct::Stream->new($self->{_raw_payload});
        $self->{payload} = SystemdJournal::DataObject->new($io__raw_payload, $self, $self->{_root});
    }
    else {
        $self->{payload} = $self->{_io}->read_bytes(($self->len_object() - 16));
    }
}

sub padding {
    my ($self) = @_;
    return $self->{padding};
}

sub object_type {
    my ($self) = @_;
    return $self->{object_type};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub len_object {
    my ($self) = @_;
    return $self->{len_object};
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
package SystemdJournal::DataObject;

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

    $self->{hash} = $self->{_io}->read_u8le();
    $self->{ofs_next_hash} = $self->{_io}->read_u8le();
    $self->{ofs_head_field} = $self->{_io}->read_u8le();
    $self->{ofs_entry} = $self->{_io}->read_u8le();
    $self->{ofs_entry_array} = $self->{_io}->read_u8le();
    $self->{num_entries} = $self->{_io}->read_u8le();
    $self->{payload} = $self->{_io}->read_bytes_full();
}

sub next_hash {
    my ($self) = @_;
    return $self->{next_hash} if ($self->{next_hash});
    if ($self->ofs_next_hash() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_next_hash());
        $self->{next_hash} = SystemdJournal::JournalObject->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{next_hash};
}

sub head_field {
    my ($self) = @_;
    return $self->{head_field} if ($self->{head_field});
    if ($self->ofs_head_field() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_head_field());
        $self->{head_field} = SystemdJournal::JournalObject->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{head_field};
}

sub entry {
    my ($self) = @_;
    return $self->{entry} if ($self->{entry});
    if ($self->ofs_entry() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_entry());
        $self->{entry} = SystemdJournal::JournalObject->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{entry};
}

sub entry_array {
    my ($self) = @_;
    return $self->{entry_array} if ($self->{entry_array});
    if ($self->ofs_entry_array() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_entry_array());
        $self->{entry_array} = SystemdJournal::JournalObject->new($io, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{entry_array};
}

sub hash {
    my ($self) = @_;
    return $self->{hash};
}

sub ofs_next_hash {
    my ($self) = @_;
    return $self->{ofs_next_hash};
}

sub ofs_head_field {
    my ($self) = @_;
    return $self->{ofs_head_field};
}

sub ofs_entry {
    my ($self) = @_;
    return $self->{ofs_entry};
}

sub ofs_entry_array {
    my ($self) = @_;
    return $self->{ofs_entry_array};
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries};
}

sub payload {
    my ($self) = @_;
    return $self->{payload};
}

1;
