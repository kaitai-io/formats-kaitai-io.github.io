# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package Zip;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COMPRESSION_NONE = 0;
our $COMPRESSION_SHRUNK = 1;
our $COMPRESSION_REDUCED_1 = 2;
our $COMPRESSION_REDUCED_2 = 3;
our $COMPRESSION_REDUCED_3 = 4;
our $COMPRESSION_REDUCED_4 = 5;
our $COMPRESSION_IMPLODED = 6;
our $COMPRESSION_DEFLATED = 8;
our $COMPRESSION_ENHANCED_DEFLATED = 9;
our $COMPRESSION_PKWARE_DCL_IMPLODED = 10;
our $COMPRESSION_BZIP2 = 12;
our $COMPRESSION_LZMA = 14;
our $COMPRESSION_IBM_TERSE = 18;
our $COMPRESSION_IBM_LZ77_Z = 19;
our $COMPRESSION_PPMD = 98;

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

    $self->{sections} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{sections}}, Zip::PkSection->new($self->{_io}, $self, $self->{_root});
    }
}

sub sections {
    my ($self) = @_;
    return $self->{sections};
}

########################################################################
package Zip::LocalFile;

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

    $self->{header} = Zip::LocalFileHeader->new($self->{_io}, $self, $self->{_root});
    $self->{body} = $self->{_io}->read_bytes($self->header()->compressed_size());
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package Zip::CentralDirEntry;

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

    $self->{version_made_by} = $self->{_io}->read_u2le();
    $self->{version_needed_to_extract} = $self->{_io}->read_u2le();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{compression_method} = $self->{_io}->read_u2le();
    $self->{last_mod_file_time} = $self->{_io}->read_u2le();
    $self->{last_mod_file_date} = $self->{_io}->read_u2le();
    $self->{crc32} = $self->{_io}->read_u4le();
    $self->{compressed_size} = $self->{_io}->read_u4le();
    $self->{uncompressed_size} = $self->{_io}->read_u4le();
    $self->{file_name_len} = $self->{_io}->read_u2le();
    $self->{extra_len} = $self->{_io}->read_u2le();
    $self->{comment_len} = $self->{_io}->read_u2le();
    $self->{disk_number_start} = $self->{_io}->read_u2le();
    $self->{int_file_attr} = $self->{_io}->read_u2le();
    $self->{ext_file_attr} = $self->{_io}->read_u4le();
    $self->{local_header_offset} = $self->{_io}->read_s4le();
    $self->{file_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->file_name_len()));
    $self->{extra} = $self->{_io}->read_bytes($self->extra_len());
    $self->{comment} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->comment_len()));
}

sub version_made_by {
    my ($self) = @_;
    return $self->{version_made_by};
}

sub version_needed_to_extract {
    my ($self) = @_;
    return $self->{version_needed_to_extract};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub compression_method {
    my ($self) = @_;
    return $self->{compression_method};
}

sub last_mod_file_time {
    my ($self) = @_;
    return $self->{last_mod_file_time};
}

sub last_mod_file_date {
    my ($self) = @_;
    return $self->{last_mod_file_date};
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub compressed_size {
    my ($self) = @_;
    return $self->{compressed_size};
}

sub uncompressed_size {
    my ($self) = @_;
    return $self->{uncompressed_size};
}

sub file_name_len {
    my ($self) = @_;
    return $self->{file_name_len};
}

sub extra_len {
    my ($self) = @_;
    return $self->{extra_len};
}

sub comment_len {
    my ($self) = @_;
    return $self->{comment_len};
}

sub disk_number_start {
    my ($self) = @_;
    return $self->{disk_number_start};
}

sub int_file_attr {
    my ($self) = @_;
    return $self->{int_file_attr};
}

sub ext_file_attr {
    my ($self) = @_;
    return $self->{ext_file_attr};
}

sub local_header_offset {
    my ($self) = @_;
    return $self->{local_header_offset};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

sub extra {
    my ($self) = @_;
    return $self->{extra};
}

sub comment {
    my ($self) = @_;
    return $self->{comment};
}

########################################################################
package Zip::PkSection;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (80, 75)));
    $self->{section_type} = $self->{_io}->read_u2le();
    my $_on = $self->section_type();
    if ($_on == 513) {
        $self->{body} = Zip::CentralDirEntry->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 1027) {
        $self->{body} = Zip::LocalFile->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 1541) {
        $self->{body} = Zip::EndOfCentralDir->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub section_type {
    my ($self) = @_;
    return $self->{section_type};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package Zip::LocalFileHeader;

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

    $self->{version} = $self->{_io}->read_u2le();
    $self->{flags} = $self->{_io}->read_u2le();
    $self->{compression} = $self->{_io}->read_u2le();
    $self->{file_mod_time} = $self->{_io}->read_u2le();
    $self->{file_mod_date} = $self->{_io}->read_u2le();
    $self->{crc32} = $self->{_io}->read_u4le();
    $self->{compressed_size} = $self->{_io}->read_u4le();
    $self->{uncompressed_size} = $self->{_io}->read_u4le();
    $self->{file_name_len} = $self->{_io}->read_u2le();
    $self->{extra_len} = $self->{_io}->read_u2le();
    $self->{file_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->file_name_len()));
    $self->{extra} = $self->{_io}->read_bytes($self->extra_len());
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub file_mod_time {
    my ($self) = @_;
    return $self->{file_mod_time};
}

sub file_mod_date {
    my ($self) = @_;
    return $self->{file_mod_date};
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub compressed_size {
    my ($self) = @_;
    return $self->{compressed_size};
}

sub uncompressed_size {
    my ($self) = @_;
    return $self->{uncompressed_size};
}

sub file_name_len {
    my ($self) = @_;
    return $self->{file_name_len};
}

sub extra_len {
    my ($self) = @_;
    return $self->{extra_len};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

sub extra {
    my ($self) = @_;
    return $self->{extra};
}

########################################################################
package Zip::EndOfCentralDir;

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

    $self->{disk_of_end_of_central_dir} = $self->{_io}->read_u2le();
    $self->{disk_of_central_dir} = $self->{_io}->read_u2le();
    $self->{qty_central_dir_entries_on_disk} = $self->{_io}->read_u2le();
    $self->{qty_central_dir_entries_total} = $self->{_io}->read_u2le();
    $self->{central_dir_size} = $self->{_io}->read_u4le();
    $self->{central_dir_offset} = $self->{_io}->read_u4le();
    $self->{comment_len} = $self->{_io}->read_u2le();
    $self->{comment} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->comment_len()));
}

sub disk_of_end_of_central_dir {
    my ($self) = @_;
    return $self->{disk_of_end_of_central_dir};
}

sub disk_of_central_dir {
    my ($self) = @_;
    return $self->{disk_of_central_dir};
}

sub qty_central_dir_entries_on_disk {
    my ($self) = @_;
    return $self->{qty_central_dir_entries_on_disk};
}

sub qty_central_dir_entries_total {
    my ($self) = @_;
    return $self->{qty_central_dir_entries_total};
}

sub central_dir_size {
    my ($self) = @_;
    return $self->{central_dir_size};
}

sub central_dir_offset {
    my ($self) = @_;
    return $self->{central_dir_offset};
}

sub comment_len {
    my ($self) = @_;
    return $self->{comment_len};
}

sub comment {
    my ($self) = @_;
    return $self->{comment};
}

1;
