BEGIN {
    META = 1;
}
// {
    if ( META == 2 ) {
	M = index($0," ");
	if ( M == 1 ) next;
	META = 1;
    }
    if ( META > 0 ) {
	L = index($0,"Notice:");
	if ( L == 1 ) {
	    META = 2;
	    print "notice=https://www.apache.org/licenses/LICENSE-2.0";
	    next;
	}
	N = sub(/\:[ \t]*/,"=",$0);
	if ( N > 0 ) {
	    split($0,parts,"=");
	    print tolower(parts[1])"="parts[2];
	    next;
	}
	META = 0;
	print "~~~~~~";
    } else {
	#K = sub(/ #.*{.*}$/,"",$0);
	#if ( K > 0 && match($0,/^ *$/) > 0 ) {
	#    next;
	#}
	print $0;
    }
}
END {
    if ( META > 0 ) {
	print "~~~~~~";
    }	
}
