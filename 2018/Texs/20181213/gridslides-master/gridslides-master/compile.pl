#!/usr/bin/perl
# Package:     gridslides
# Description: LaTeX package to create free form slides with blocks placed on a grid
# File:        compile.pl
# Author:      Daniel Mendler <mail@daniel-mendler.de>
# Version:     0.1.1
# Date:        2017-11-28
# License:     GPL2 or LPPL1.3 at your option
# Homepage:    https://github.com/minad/gridslides

use strict;
use Digest::MD5 qw(md5_hex);
use File::Slurp qw(read_file write_file);

sub load_file {
    my ($file) = @_;
    my $code = read_file($file);
    $code =~ /\A(.*?\\begin\{document\})/s;
    return ($1, $');
}

sub compile_slide {
    my ($format, $slide, $body) = @_;

    my $code = "%&$format\n\\begin{document}\\setcounter{slide}{$slide}\n$body\n\\end{document}\n";
    my $hash = md5_hex($code);
    my $pdf = "$hash.pdf";
    unless (-e $pdf) {
        my $tex = "$hash.tex";
        write_file($tex, $code);
        print "Compiling slide $slide - $tex...\n";
        `pdflatex -interaction=batchmode $tex; biber $hash; pdflatex -interaction=batchmode $tex; pdflatex -interaction=batchmode $tex`;
    }

    return $pdf;
}

my $once = 0;
my $file;
if ($ARGV[0] eq "--once") {
    $file = $ARGV[1];
    $once = 1;
} else {
    $file = $ARGV[0];
}

my $result = $file;
$result =~ s/\.tex\Z//g;
$result .= '.pdf';

my $out = 'output';
mkdir($out);
chdir($out);
$ENV{TEXINPUTS}='..:.:';
$ENV{BIBINPUTS}='..';

my ($header, $body) = load_file "../$file";
my $format = "header$file";
write_file("$format.tex", "$header\n\\end{document}");
`pdftex -interaction=batchmode -ini -jobname="$format" '&pdflatex' mylatexformat.ltx "$format.tex"`;

do {
    my @slides = ();
    my $slide = 1;
    while ($body =~ /(\\maketitle|\\begin\{.*?slide\}.*?\\end\{.*?slide\})/sg) {
        my $pdf = compile_slide "$format", $slide, $1;
        push @slides, $pdf if (-e $pdf);
        ++$slide;
    }

    print "Joining $result...\n";
    `pdfjoin -q -o $result @slides`;
    rename $result, "../$result";

    unless ($once) {
        `inotifywait -e modify ../$file`;
        (my $unused, $body) = load_file "../$file";
    }
} until ($once);
