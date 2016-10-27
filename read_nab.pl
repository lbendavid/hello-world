#!/usr/bin/perl
# From GitHub
# Pas de change en vue a part l'ajout de ce commentaire

use strict;
use warnings;
use Data::Dumper;
use Getopt::Long;

my @projects;

local $/ = undef;
my $slurp = <>;

my ($all_projects) = ($slurp =~ m{
	<INDEX_PROJETS>(.+)</INDEX_PROJETS>
}xms);
while ($all_projects =~ m{
<DOMAINE \s+ name="(\w+)"[^>]*>(.+?)</DOMAINE>
}xgms) {
	my ($domain, $domain_projects) = ($1, $2);
	while ($domain_projects =~ m{
		<ETAT \s+ name="(\w+)">(.+?)</ETAT>
	}xgms) {
		my ($state, $state_projects) = ($1, $2);
		while ($state_projects =~ m{
		<LIGNE>(.+?)</LIGNE>
		}xgms) {
			my ($row) = ($1);
			my %row;
			foreach my $item (split m/\n/, $row) {
				if ($item =~ m{
					<(\w+)><!\[CDATA\[([^\]]+)
				}xms) {
					my ($id, $content) = ($1, $2);
					$row{$id} = $content;
				}
				@row{qw(DOMAINE ETAT)} = ($domain, $state);
			}
			push @projects, \%row;
		}
	}
}

# Debut d'un affichage malin
foreach my $project_re (@projects) {
	print "Project:\n";
	while (my ($k, $v) = each %{$project_re}) {
		print "\t$k: $v\n";
	}
}

#print $all_projects;

=pod

=head1 SYNOPSIS

read_nab.pl - lit un fichier nab.xml et affiche son contenu

=head1 USAGE

read_nab.pl nab.xml

=head1 DESCRIPTION

Lit un fichier nab.xml le nettoie et l'affiche en structure Perl simplifié.

