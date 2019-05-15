
// populating drop-down values for BU and SubBU
var bu_list=bu_list;
var sub_bu_list=sub_bu_list;


var year_list=[]

for (var i=1970;i<2009;i++)
{
    year_list.push(i);

}

var select = document.getElementById("yearofbirth");
for(index in year_list) 
{
    select.options[select.options.length] = new Option(year_list[index]);
    
}



var yob_select=d3.select("#yearofbirth").property("value").trim();
// var sub_bu_select=d3.select("#inputSubBU").property("value").trim();



//
