use feature ':5.10';

################## data seperating variables############
my $column_seperator = "|";
my $row_breaker = "\n";
########################################################

my $id = 1;

print "Please enter the file path of the csv with file name\n";
my $file_path = <>;

substr($file_path, -1, 1) = '';
unless(substr($file_path, -4, 4) eq ".csv"){
    if(substr($file_path, -1, 1) eq '/'){
	$file_path = $file_path."user_id";
    }
    my @file_path_parts = ($file_path, 'csv');
    $file_path = join('.', @file_path_parts);
}

open (FH, ">".$file_path) or die "Can't write to ".$file_path."$!";

print FH "[{\"id\":\"880310186V\",\"msisdn\":\"0779545015\",\"name\":\"rajith delantha\",\"city\":\"kadawatha\"},".$row_breaker;
print FH "{\"id\":\"880310187V\",\"msisdn\":\"0779545015\",\"name\":\"rajith delantha\",\"city\":\"kadawatha\"},".$row_breaker;
print FH "{\"id\":\"880310188V\",\"msisdn\":\"0779545015\",\"name\":\"rajith delantha\",\"city\":\"kadawatha\"},".$row_breaker;
print FH "{\"id\":\"880310189V\",\"msisdn\":\"0779545015\",\"name\":\"rajith delantha\",\"city\":\"kadawatha\"},".$row_breaker;
print FH "{\"id\":\"880310180V\",\"msisdn\":\"0779545015\",\"name\":\"rajith delantha\",\"city\":\"kadawatha\"}]".$row_breaker;



close(FH);

say "file added successfully here ".$file_path;