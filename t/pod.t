#!/usr/bin/perl -w

# $Id: pod.t 1347 2004-05-26 09:10:20Z jonasbn $

#pod test courtesy of petdance
#http://use.perl.org/~petdance/journal/12391

use Test::More; 
use File::Spec; 
use File::Find; 
use strict; 

eval "use Test::Pod 0.95"; 

if ($@) { 
	plan skip_all => 'Test::Pod v0.95 required for testing POD';
} else { 
	Test::Pod->import; 
	my @files; 
	my $blib = File::Spec->catfile(qw(blib lib)); 
	find( sub {push @files, $File::Find::name if /\.p(l|m|od)$/}, $blib); 
	plan tests => scalar @files; 
	foreach my $file (@files) { 
		pod_file_ok($file); 
	} 
}