# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;
use DosDatetime;

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
our $COMPRESSION_ZSTANDARD = 93;
our $COMPRESSION_MP3 = 94;
our $COMPRESSION_XZ = 95;
our $COMPRESSION_JPEG = 96;
our $COMPRESSION_WAVPACK = 97;
our $COMPRESSION_PPMD = 98;
our $COMPRESSION_AEX_ENCRYPTION_MARKER = 99;

our $EXTRA_CODES_ZIP64 = 1;
our $EXTRA_CODES_AV_INFO = 7;
our $EXTRA_CODES_OS2 = 9;
our $EXTRA_CODES_NTFS = 10;
our $EXTRA_CODES_OPENVMS = 12;
our $EXTRA_CODES_PKWARE_UNIX = 13;
our $EXTRA_CODES_FILE_STREAM_AND_FORK_DESCRIPTORS = 14;
our $EXTRA_CODES_PATCH_DESCRIPTOR = 15;
our $EXTRA_CODES_PKCS7 = 20;
our $EXTRA_CODES_X509_CERT_ID_AND_SIGNATURE_FOR_FILE = 21;
our $EXTRA_CODES_X509_CERT_ID_FOR_CENTRAL_DIR = 22;
our $EXTRA_CODES_STRONG_ENCRYPTION_HEADER = 23;
our $EXTRA_CODES_RECORD_MANAGEMENT_CONTROLS = 24;
our $EXTRA_CODES_PKCS7_ENC_RECIP_CERT_LIST = 25;
our $EXTRA_CODES_IBM_S390_UNCOMP = 101;
our $EXTRA_CODES_IBM_S390_COMP = 102;
our $EXTRA_CODES_POSZIP_4690 = 18064;
our $EXTRA_CODES_EXTENDED_TIMESTAMP = 21589;
our $EXTRA_CODES_BEOS = 25922;
our $EXTRA_CODES_ASI_UNIX = 30062;
our $EXTRA_CODES_INFOZIP_UNIX = 30805;
our $EXTRA_CODES_INFOZIP_UNIX_VAR_SIZE = 30837;
our $EXTRA_CODES_AEX_ENCRYPTION = 39169;
our $EXTRA_CODES_APACHE_COMMONS_COMPRESS = 41246;
our $EXTRA_CODES_MICROSOFT_OPEN_PACKAGING_GROWTH_HINT = 41504;
our $EXTRA_CODES_SMS_QDOS = 64842;

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
    $self->{body} = $self->{_io}->read_bytes($self->header()->len_body_compressed());
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
package Zip::DataDescriptor;

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

    $self->{crc32} = $self->{_io}->read_u4le();
    $self->{len_body_compressed} = $self->{_io}->read_u4le();
    $self->{len_body_uncompressed} = $self->{_io}->read_u4le();
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub len_body_compressed {
    my ($self) = @_;
    return $self->{len_body_compressed};
}

sub len_body_uncompressed {
    my ($self) = @_;
    return $self->{len_body_uncompressed};
}

########################################################################
package Zip::ExtraField;

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

    $self->{code} = $self->{_io}->read_u2le();
    $self->{len_body} = $self->{_io}->read_u2le();
    my $_on = $self->code();
    if ($_on == $Zip::EXTRA_CODES_NTFS) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Zip::ExtraField::Ntfs->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Zip::EXTRA_CODES_EXTENDED_TIMESTAMP) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Zip::ExtraField::ExtendedTimestamp->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Zip::EXTRA_CODES_INFOZIP_UNIX_VAR_SIZE) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Zip::ExtraField::InfozipUnixVarSize->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len_body());
    }
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Zip::ExtraField::Ntfs;

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

    $self->{reserved} = $self->{_io}->read_u4le();
    $self->{attributes} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{attributes}}, Zip::ExtraField::Ntfs::Attribute->new($self->{_io}, $self, $self->{_root});
    }
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

########################################################################
package Zip::ExtraField::Ntfs::Attribute;

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

    $self->{tag} = $self->{_io}->read_u2le();
    $self->{len_body} = $self->{_io}->read_u2le();
    my $_on = $self->tag();
    if ($_on == 1) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Zip::ExtraField::Ntfs::Attribute1->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len_body());
    }
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Zip::ExtraField::Ntfs::Attribute1;

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

    $self->{last_mod_time} = $self->{_io}->read_u8le();
    $self->{last_access_time} = $self->{_io}->read_u8le();
    $self->{creation_time} = $self->{_io}->read_u8le();
}

sub last_mod_time {
    my ($self) = @_;
    return $self->{last_mod_time};
}

sub last_access_time {
    my ($self) = @_;
    return $self->{last_access_time};
}

sub creation_time {
    my ($self) = @_;
    return $self->{creation_time};
}

########################################################################
package Zip::ExtraField::ExtendedTimestamp;

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

    $self->{_raw_flags} = $self->{_io}->read_bytes(1);
    my $io__raw_flags = IO::KaitaiStruct::Stream->new($self->{_raw_flags});
    $self->{flags} = Zip::ExtraField::ExtendedTimestamp::InfoFlags->new($io__raw_flags, $self, $self->{_root});
    if ($self->flags()->has_mod_time()) {
        $self->{mod_time} = $self->{_io}->read_u4le();
    }
    if ($self->flags()->has_access_time()) {
        $self->{access_time} = $self->{_io}->read_u4le();
    }
    if ($self->flags()->has_create_time()) {
        $self->{create_time} = $self->{_io}->read_u4le();
    }
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub mod_time {
    my ($self) = @_;
    return $self->{mod_time};
}

sub access_time {
    my ($self) = @_;
    return $self->{access_time};
}

sub create_time {
    my ($self) = @_;
    return $self->{create_time};
}

sub _raw_flags {
    my ($self) = @_;
    return $self->{_raw_flags};
}

########################################################################
package Zip::ExtraField::ExtendedTimestamp::InfoFlags;

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

    $self->{has_mod_time} = $self->{_io}->read_bits_int_le(1);
    $self->{has_access_time} = $self->{_io}->read_bits_int_le(1);
    $self->{has_create_time} = $self->{_io}->read_bits_int_le(1);
    $self->{reserved} = $self->{_io}->read_bits_int_le(5);
}

sub has_mod_time {
    my ($self) = @_;
    return $self->{has_mod_time};
}

sub has_access_time {
    my ($self) = @_;
    return $self->{has_access_time};
}

sub has_create_time {
    my ($self) = @_;
    return $self->{has_create_time};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

########################################################################
package Zip::ExtraField::InfozipUnixVarSize;

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
    $self->{len_uid} = $self->{_io}->read_u1();
    $self->{uid} = $self->{_io}->read_bytes($self->len_uid());
    $self->{len_gid} = $self->{_io}->read_u1();
    $self->{gid} = $self->{_io}->read_bytes($self->len_gid());
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub len_uid {
    my ($self) = @_;
    return $self->{len_uid};
}

sub uid {
    my ($self) = @_;
    return $self->{uid};
}

sub len_gid {
    my ($self) = @_;
    return $self->{len_gid};
}

sub gid {
    my ($self) = @_;
    return $self->{gid};
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
    $self->{_raw_file_mod_time} = $self->{_io}->read_bytes(4);
    my $io__raw_file_mod_time = IO::KaitaiStruct::Stream->new($self->{_raw_file_mod_time});
    $self->{file_mod_time} = DosDatetime->new($io__raw_file_mod_time);
    $self->{crc32} = $self->{_io}->read_u4le();
    $self->{len_body_compressed} = $self->{_io}->read_u4le();
    $self->{len_body_uncompressed} = $self->{_io}->read_u4le();
    $self->{len_file_name} = $self->{_io}->read_u2le();
    $self->{len_extra} = $self->{_io}->read_u2le();
    $self->{len_comment} = $self->{_io}->read_u2le();
    $self->{disk_number_start} = $self->{_io}->read_u2le();
    $self->{int_file_attr} = $self->{_io}->read_u2le();
    $self->{ext_file_attr} = $self->{_io}->read_u4le();
    $self->{ofs_local_header} = $self->{_io}->read_s4le();
    $self->{file_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_file_name()));
    $self->{_raw_extra} = $self->{_io}->read_bytes($self->len_extra());
    my $io__raw_extra = IO::KaitaiStruct::Stream->new($self->{_raw_extra});
    $self->{extra} = Zip::Extras->new($io__raw_extra, $self, $self->{_root});
    $self->{comment} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_comment()));
}

sub local_header {
    my ($self) = @_;
    return $self->{local_header} if ($self->{local_header});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_local_header());
    $self->{local_header} = Zip::PkSection->new($self->{_io}, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{local_header};
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

sub file_mod_time {
    my ($self) = @_;
    return $self->{file_mod_time};
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub len_body_compressed {
    my ($self) = @_;
    return $self->{len_body_compressed};
}

sub len_body_uncompressed {
    my ($self) = @_;
    return $self->{len_body_uncompressed};
}

sub len_file_name {
    my ($self) = @_;
    return $self->{len_file_name};
}

sub len_extra {
    my ($self) = @_;
    return $self->{len_extra};
}

sub len_comment {
    my ($self) = @_;
    return $self->{len_comment};
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

sub ofs_local_header {
    my ($self) = @_;
    return $self->{ofs_local_header};
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

sub _raw_file_mod_time {
    my ($self) = @_;
    return $self->{_raw_file_mod_time};
}

sub _raw_extra {
    my ($self) = @_;
    return $self->{_raw_extra};
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

    $self->{magic} = $self->{_io}->read_bytes(2);
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
    elsif ($_on == 2055) {
        $self->{body} = Zip::DataDescriptor->new($self->{_io}, $self, $self->{_root});
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
package Zip::Extras;

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
        push @{$self->{entries}}, Zip::ExtraField->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
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
    $self->{_raw_flags} = $self->{_io}->read_bytes(2);
    my $io__raw_flags = IO::KaitaiStruct::Stream->new($self->{_raw_flags});
    $self->{flags} = Zip::LocalFileHeader::GpFlags->new($io__raw_flags, $self, $self->{_root});
    $self->{compression_method} = $self->{_io}->read_u2le();
    $self->{_raw_file_mod_time} = $self->{_io}->read_bytes(4);
    my $io__raw_file_mod_time = IO::KaitaiStruct::Stream->new($self->{_raw_file_mod_time});
    $self->{file_mod_time} = DosDatetime->new($io__raw_file_mod_time);
    $self->{crc32} = $self->{_io}->read_u4le();
    $self->{len_body_compressed} = $self->{_io}->read_u4le();
    $self->{len_body_uncompressed} = $self->{_io}->read_u4le();
    $self->{len_file_name} = $self->{_io}->read_u2le();
    $self->{len_extra} = $self->{_io}->read_u2le();
    $self->{file_name} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_file_name()));
    $self->{_raw_extra} = $self->{_io}->read_bytes($self->len_extra());
    my $io__raw_extra = IO::KaitaiStruct::Stream->new($self->{_raw_extra});
    $self->{extra} = Zip::Extras->new($io__raw_extra, $self, $self->{_root});
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub compression_method {
    my ($self) = @_;
    return $self->{compression_method};
}

sub file_mod_time {
    my ($self) = @_;
    return $self->{file_mod_time};
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub len_body_compressed {
    my ($self) = @_;
    return $self->{len_body_compressed};
}

sub len_body_uncompressed {
    my ($self) = @_;
    return $self->{len_body_uncompressed};
}

sub len_file_name {
    my ($self) = @_;
    return $self->{len_file_name};
}

sub len_extra {
    my ($self) = @_;
    return $self->{len_extra};
}

sub file_name {
    my ($self) = @_;
    return $self->{file_name};
}

sub extra {
    my ($self) = @_;
    return $self->{extra};
}

sub _raw_flags {
    my ($self) = @_;
    return $self->{_raw_flags};
}

sub _raw_file_mod_time {
    my ($self) = @_;
    return $self->{_raw_file_mod_time};
}

sub _raw_extra {
    my ($self) = @_;
    return $self->{_raw_extra};
}

########################################################################
package Zip::LocalFileHeader::GpFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $DEFLATE_MODE_NORMAL = 0;
our $DEFLATE_MODE_MAXIMUM = 1;
our $DEFLATE_MODE_FAST = 2;
our $DEFLATE_MODE_SUPER_FAST = 3;

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

    $self->{file_encrypted} = $self->{_io}->read_bits_int_le(1);
    $self->{comp_options_raw} = $self->{_io}->read_bits_int_le(2);
    $self->{has_data_descriptor} = $self->{_io}->read_bits_int_le(1);
    $self->{reserved_1} = $self->{_io}->read_bits_int_le(1);
    $self->{comp_patched_data} = $self->{_io}->read_bits_int_le(1);
    $self->{strong_encrypt} = $self->{_io}->read_bits_int_le(1);
    $self->{reserved_2} = $self->{_io}->read_bits_int_le(4);
    $self->{lang_encoding} = $self->{_io}->read_bits_int_le(1);
    $self->{reserved_3} = $self->{_io}->read_bits_int_le(1);
    $self->{mask_header_values} = $self->{_io}->read_bits_int_le(1);
    $self->{reserved_4} = $self->{_io}->read_bits_int_le(2);
}

sub deflated_mode {
    my ($self) = @_;
    return $self->{deflated_mode} if ($self->{deflated_mode});
    if ( (($self->_parent()->compression_method() == $Zip::COMPRESSION_DEFLATED) || ($self->_parent()->compression_method() == $Zip::COMPRESSION_ENHANCED_DEFLATED)) ) {
        $self->{deflated_mode} = $self->comp_options_raw();
    }
    return $self->{deflated_mode};
}

sub imploded_dict_byte_size {
    my ($self) = @_;
    return $self->{imploded_dict_byte_size} if ($self->{imploded_dict_byte_size});
    if ($self->_parent()->compression_method() == $Zip::COMPRESSION_IMPLODED) {
        $self->{imploded_dict_byte_size} = ((($self->comp_options_raw() & 1) != 0 ? 8 : 4) * 1024);
    }
    return $self->{imploded_dict_byte_size};
}

sub imploded_num_sf_trees {
    my ($self) = @_;
    return $self->{imploded_num_sf_trees} if ($self->{imploded_num_sf_trees});
    if ($self->_parent()->compression_method() == $Zip::COMPRESSION_IMPLODED) {
        $self->{imploded_num_sf_trees} = (($self->comp_options_raw() & 2) != 0 ? 3 : 2);
    }
    return $self->{imploded_num_sf_trees};
}

sub lzma_has_eos_marker {
    my ($self) = @_;
    return $self->{lzma_has_eos_marker} if ($self->{lzma_has_eos_marker});
    if ($self->_parent()->compression_method() == $Zip::COMPRESSION_LZMA) {
        $self->{lzma_has_eos_marker} = ($self->comp_options_raw() & 1) != 0;
    }
    return $self->{lzma_has_eos_marker};
}

sub file_encrypted {
    my ($self) = @_;
    return $self->{file_encrypted};
}

sub comp_options_raw {
    my ($self) = @_;
    return $self->{comp_options_raw};
}

sub has_data_descriptor {
    my ($self) = @_;
    return $self->{has_data_descriptor};
}

sub reserved_1 {
    my ($self) = @_;
    return $self->{reserved_1};
}

sub comp_patched_data {
    my ($self) = @_;
    return $self->{comp_patched_data};
}

sub strong_encrypt {
    my ($self) = @_;
    return $self->{strong_encrypt};
}

sub reserved_2 {
    my ($self) = @_;
    return $self->{reserved_2};
}

sub lang_encoding {
    my ($self) = @_;
    return $self->{lang_encoding};
}

sub reserved_3 {
    my ($self) = @_;
    return $self->{reserved_3};
}

sub mask_header_values {
    my ($self) = @_;
    return $self->{mask_header_values};
}

sub reserved_4 {
    my ($self) = @_;
    return $self->{reserved_4};
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
    $self->{num_central_dir_entries_on_disk} = $self->{_io}->read_u2le();
    $self->{num_central_dir_entries_total} = $self->{_io}->read_u2le();
    $self->{len_central_dir} = $self->{_io}->read_u4le();
    $self->{ofs_central_dir} = $self->{_io}->read_u4le();
    $self->{len_comment} = $self->{_io}->read_u2le();
    $self->{comment} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_comment()));
}

sub disk_of_end_of_central_dir {
    my ($self) = @_;
    return $self->{disk_of_end_of_central_dir};
}

sub disk_of_central_dir {
    my ($self) = @_;
    return $self->{disk_of_central_dir};
}

sub num_central_dir_entries_on_disk {
    my ($self) = @_;
    return $self->{num_central_dir_entries_on_disk};
}

sub num_central_dir_entries_total {
    my ($self) = @_;
    return $self->{num_central_dir_entries_total};
}

sub len_central_dir {
    my ($self) = @_;
    return $self->{len_central_dir};
}

sub ofs_central_dir {
    my ($self) = @_;
    return $self->{ofs_central_dir};
}

sub len_comment {
    my ($self) = @_;
    return $self->{len_comment};
}

sub comment {
    my ($self) = @_;
    return $self->{comment};
}

1;
