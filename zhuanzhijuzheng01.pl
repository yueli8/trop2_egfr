    #! /usr/bin/perl -w  
    use strict;  
    die "perl $0 \n" unless @ARGV==1;  
    my $lst=shift;  
    open IN,$lst;  
    my (@a,@b);  
    my $len;  
    my $max=0;  
    while(<IN>){  
            chomp;  
            @b=split/\t+/,$_;  
            $len=@b;  
            $max=$max > $len ? $max:$len;  
            push @a,[@b];  
    }  
    close IN;  
    for my $i(0..$max-1){  
            for(@a){  
                    @$_[$i]||="";  
                    print "@$_[$i]\t";  
            }  
            print "\n";  
    }  
    __END__  
