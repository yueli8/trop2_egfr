open(IN1,"tmp.txt") || die "Cannot open this file";

@lines1 = <IN1>;

open(IN2,"paad_zhuanzhi") || die "Cannot open this file";

@lines2 = <IN2>;


open(OUT,">tmp03") || die "Cannot open this file";

for $item1(@lines1){

	chomp $item1;


	print OUT $item1,"\t";

@tmp1=split(/\s+/, $item1);


for $item2(@lines2){

	chomp $item2;

@tmp2=split(/\s+/, $item2);

		if ($tmp1[0] eq $tmp2[0]){

			print OUT $item2;

			last;	

		}

	$i++
}


print OUT "\n";


}


close(IN1);

close(IN2);

close(OUT);
