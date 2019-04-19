var income = 35000;
var debtIncomeRatio = .2;
var yearsInJob = 3;
var criminalRecord = false;
var goodcredit=true;

if (income < 30000)
{
    if (debtIncomeRatio<0.5)
    {
        console.log("Not qulaified for a loan")
    }
    else
    {
        console.log("Qualified for a Loan")
    }

}

else if (income >=30000 && income <=75000)
{
    if (yearsInJob<1)
    {
        console.log("Not qulaified for a loan")
    }
    else if (yearsInJob >=1 && yearsInJob<5)
    {
        if(goodcredit===true)
        {
            console.log("Qualified for a Loan")
        }
        else
        {
            console.log("Not qulaified for a loan")
        }
    }
    else
    {
        console.log("Qualified for a Loan")
    }
}

else if (income > 75000)
{
    if (criminalRecord===true)
    {
        console.log("Not qulaified for a loan")
    }
    else
    {
        console.log("Qualified for a Loan")
    }
}