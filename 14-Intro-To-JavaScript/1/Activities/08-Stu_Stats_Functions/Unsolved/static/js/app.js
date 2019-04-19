var movieScore = [4.4, 3.3, 5.9, 8.8, 1.2, 5.2, 7.4, 7.5, 7.2, 9.7, 4.2, 6.9];

var monthlyAvgRainFall = [3.03, 2.48, 3.23, 3.15, 4.13, 3.23];

var mileRunTimes = [5.06, 4.54, 5.56, 4.40, 7.10];

function calc_mean(arr)
{   
    var sum=0;
    var average=0;
    for(var i=0;i<arr.length;i++)
    {
        sum=sum+arr[i];
    }
    return (average=sum/arr.length);
    
}

function calc_variance(arr,mean)
{
    var temp1=0;
    var temp2=0;
    var var_arr=[];
    var sum=0;
    for(var i=0;i<arr.length;i++)
    {
        temp1=arr[i]-mean;
        temp2=temp1*temp1;
        
        var_arr.push(temp2);
        sum=sum+temp2;
        
    }
    return(sum/var_arr.length)
}

function calc_std_dev(variance)
{
    return Math.sqrt(variance);
}

var FinalMean1=calc_mean(movieScore);
var FinalVariance1=calc_variance(movieScore,FinalMean1);
var FinalStdDev1=calc_std_dev(FinalVariance1);

var FinalMean2=calc_mean(monthlyAvgRainFall);
var FinalVariance2=calc_variance(monthlyAvgRainFall,FinalMean2);
var FinalStdDev2=calc_std_dev(FinalVariance2);

console.log(`The mean of movies is ${FinalMean1}`);
console.log(`The variance of movies is ${FinalVariance1}`);
console.log(`The Std Dev of movies is ${FinalStdDev1}`);

console.log("========================================================")

console.log(`The mean of Rainfall is ${FinalMean2}`);
console.log(`The variance of Rainfall is ${FinalVariance2}`);
console.log(`The Std Dev of Raifall is ${FinalStdDev2}`);