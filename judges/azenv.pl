#!/usr/bin/perl
#
# Use the correct shebang according to OS.
# You can rename this script to azenv.cgi if .pl
# extension is not supported.
#
##########################################################################
#
#	AZ Environment variables 1.05 © 2024 AZ
#	Civil Liberties Advocacy Network
#	http://clan.cyaccess.com   http://clanforum.cyaccess.com
#
#	AZenv is written in PHP & Perl. It is coded to be simple,
#	fast and have negligible load on the server.
#	AZenv is primarily aimed for programs using external scripts to
#	verify the passed Environment variables.
#	Only the absolutely necessary parameters are included.
#	AZenv is free software; you can use and redistribute it freely.
#	Please do not remove the copyright information.
#
##########################################################################

my $query_string = $ENV{'QUERY_STRING'} || '';
%params = map { split(/=/, $_) } split(/&/, $query_string);
if (exists $params{"json"}) {
    use JSON;
    %arr = ();
    foreach $var (keys(%ENV)) {
        if ($var =~ /REMOTE/ || $var =~ /HTTP/ || $var =~ /REQUEST/) {
            $arr{$var} = $ENV{$var};
        }
    }
    $json = encode_json(\%arr);
    print <<EOC;
Content-Type: application/json

$json
EOC

} else {
    print <<EOC;
Content-type: text/html

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>AZ Environment variables 1.05</title>
</head>
<body>
<pre>
EOC

    foreach $var (keys(%ENV)) {
        if ($var =~ /REMOTE/ || $var =~ /HTTP/ || $var =~ /REQUEST/) {
            print $var.' = '.$ENV{$var}."\n";
        }
    }

    print <<EOC;
</pre>
</body>
</html>
EOC
}
