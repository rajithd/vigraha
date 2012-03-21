#number
#navigation
#date time
#duration

#!/usr/bin/perl

use feature "switch";

our @possibleValues=(["94779000001","94779000002","94779000003"], #number
["www.ebay.com","www.cricinfo.com","www.pizzahut.com","www.dialog.lk"],  #navigation
);   #call type

sub datetime{
	######################
	my $yearRange = 1; #one year
	my $startingYear = 2011; # starting from 2011

	my $monthRange = 12;   # all the 12 months
	my $startingMonth = 1; # string from January

	my $dayRange = 31; # 31 days
	my $startingDay=1; # starting from 1st
	######################
	my $yyyy = int(rand($yearRange))+$startingYear;
	my $mm	= int(rand($monthRange))+$startingMonth;
	my $dd = int(rand($dayRange))+$startingDay;
	my $HH = int(rand(24));
	my $min = int(rand(60));
	my $ss = int(rand(60));
#print "$yyyy-$mm-$dd $HH:$min:$ss";
push(@datarow,"$yyyy-$mm-$dd $HH:$min:$ss" )#"$yyyy$mm$dd$HH$min$ss"
}

sub duration_time {
    my $HH = int(rand(24));
    my $min = int(rand(60));
    my $ss = int(rand(60));
    push(@datarow,"$HH:$min:$ss" )

}

sub selectfield{
	my $val = $_[0];

	given ($val){
		when(1)     { push(@datarow,$possibleValues[0][int(rand(3))])}  #Number
		when(2)     { push(@datarow,$possibleValues[1][int(rand(4))])}  #Navigation
		when(3)		{ &datetime() }  #when
		when(4)		{ &duration_time() }  #duration
	}
}


print "The number of records have to be generate: ";
our $numberofdata=<>;
print "Enter the path for the file: ";
our $fullname =<>;
print "Enter the starting sequence number: ";
our $startseq=<>;

$separator = "|"; # value separator

$surrounder="";

open FILE, ">$fullname" or die $!;

for ($j=0;$j<$numberofdata;$j++){
	our @datarow=();
	push(@datarow,$j+$startseq);
		for($i=1;$i<40;$i++){
			&selectfield($i);
		}
    $"=$surrounder.$separator.$surrounder;
	print FILE "$surrounder@datarow$surrounder\n";
}

close FILE;