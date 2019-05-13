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
var uniquecities = cities.filter(function(elem, index, self) 
{
    return index === self.indexOf(elem);
})
console.log(uniquecities);


// var ddlItems = document.getElementById("CityList"),
    
    
// for (var i = 0; i < cities.length; i++) 
//     {
//       var opt = cities[i];
//       var el = document.createElement("option");
//       el.textContent = opt;
//       el.value = opt;
//       ddlItems.appendChild(el);
//     };



// var dropdown = document.getElementById("CityList");
var select = document.getElementById("CityList");

for(index in uniquecities) 
{
    select.options[select.options.length] = new Option(uniquecities[index]);
    console.log(select.options[select.options.length]);
}


    function buttonClick2() 
    {

     d3.event.preventDefault();
      let city1 = d3.select("#CityList").property("value");
      let filteredData = tableData;
      if (city1) 
      {
        filteredData = filteredData.filter(row => row.city === city1);
      }
      table(filteredData);
    }
    d3.selectAll("#filter-btn").on("click", buttonClick2);
    table(tableData);