package PowerDNS::API;
use Dancer ':syntax';
use PowerDNS::API::Handler::API;

our $VERSION = '0.1';

set 'logger' => 'console';
set 'log' => 'debug';
set 'show_errors' => 1;
set 'access_log' => 1;
set 'warnings' => 1;

set plack_middlewares => [
   [ 'Deflater' ],
];

prefix undef;

get '/' => sub {
    debug "main index!";
    template 'index';
};

true;

__END__

=pod

=head1 NAME

PowerDNS::API - HTTP API to PowerDNS Data
 
=head1 DESCRIPTION


=head1 AUTHOR

Ask Bjørn Hansen, C<< <ask at develooper.com> >>

=head1 BUGS

Please report any bugs or feature requests to the issue tracker at
L<http://github.com/abh/PowerDNS-API/issues>.

The Git repository is available at
L<http://github.com/abh/PowerDNS-API>


=head1 COPYRIGHT & LICENSE

Copyright 2011 Ask Bjørn Hansen, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
