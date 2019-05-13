
// populating drop-down values for BU and SubBU
var bu_list=bu_list;
var sub_bu_list=sub_bu_list;

var select = document.getElementById("inputBU");
for(index in bu_list) 
{
    select.options[select.options.length] = new Option(bu_list[index]);
    
}

console.log(sub_bu_list);
var select = document.getElementById("inputSubBU");
for(index in sub_bu_list) 
{
    select.options[select.options.length] = new Option(sub_bu_list[index]);
    
}

var bu_select=d3.select("#inputBU").property("value").trim();
var sub_bu_select=d3.select("#inputSubBU").property("value").trim();



//
function clearFields() {
    document.getElementById("product").value=""
    
}