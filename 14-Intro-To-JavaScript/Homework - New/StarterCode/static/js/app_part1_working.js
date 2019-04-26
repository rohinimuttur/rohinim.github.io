// from data.js
let tableData = data;

let tbody = d3.select("tbody");

var cities=[];

data.forEach((item) => 
{

    // Iterate through each key and value
    Object.entries(item).forEach(([key, value]) => 
    {
  
      // Use the key to determine which array to push the value to
      if (key === "city" )
       {
        cities.push(value);
      }
     
     }
     );
  });
//remove duplicates from the cities list
var uniquecities = cities.filter(function(elem, index, self) 
{
    return index === self.indexOf(elem);
})
console.log(uniquecities);

// Populate the Cities dropdown
var select = document.getElementById("CityList");

for(index in uniquecities) 
{
    select.options[select.options.length] = new Option(uniquecities[index]);
    console.log(select.options[select.options.length]);
}


///-------------------------------------
function table(data) 
{
  tbody.html("");
//something is wrong here...
  data.forEach((dataRow) => 
  {
    let row = tbody.append("tr");
    Object.values(dataRow).forEach((val) => 
    {
      let ufoInfo = row.append("td");
        ufoInfo.text(val);
    }
    );
  });
}

function buttonClick() 
{

 d3.event.preventDefault();
  let date = d3.select("#datetime").property("value");
  let city1 = d3.select("#CityList").property("value");
  let filteredData = tableData;
  if (date && city1) 
  {
    filteredData = filteredData.filter(row => row.datetime === date && row.city === city1);
  }
  table(filteredData);
}
d3.selectAll("#filter-btn").on("click", buttonClick);
table(tableData);



