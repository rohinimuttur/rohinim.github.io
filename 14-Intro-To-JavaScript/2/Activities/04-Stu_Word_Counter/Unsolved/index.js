var s="I am the night king and I will destroy the world and become the king of the whole world !";

var s_arr=s.split(" ");


var wrdfreq={};

for (var i=0;i<s_arr.length;i++)
{   
    crntwrd=s_arr[i];
    //console.log(crntwrd);
    if (crntwrd in wrdfreq)
    {
        wrdfreq[crntwrd]+=1;
    }
    else
    {
        wrdfreq[crntwrd]=1;
    }
    
}

console.log(wrdfreq);

