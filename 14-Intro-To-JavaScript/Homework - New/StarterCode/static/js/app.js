// from data.js
let tableData = data;

let tbody = d3.select("tbody");

var cities=[];
var states=[];
var countries=[];
var shapes=[];

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
      if (key === "state" )
       {
        states.push(value);
      }
      if (key === "country" )
       {
        countries.push(value);
      }
      if (key === "shape" )
       {
        shapes.push(value);
      }
     
     }
     );
  });
//remove duplicates from the all the lists
var uniquecities = cities.filter(function(elem, index, self) 
{
    return index === self.indexOf(elem);
})
//uniquecities.sort();
var uniquestates = states.filter(function(elem, index, self) 
{
    return index === self.indexOf(elem);
})
//uniquestates.sort();
var uniquecountries = countries.filter(function(elem, index, self) 
{
    return index === self.indexOf(elem);
})
////uniquecountries.sort();
var uniqueshapes = shapes.filter(function(elem, index, self) 
{
    return index === self.indexOf(elem);
})

//uniqueshapes.sort();
//console.log(uniquecities);

// Populate the Cities dropdown
var select = document.getElementById("CityList");
for(index in uniquecities) 
{
    select.options[select.options.length] = new Option(uniquecities[index]);
    
}

var select1 = document.getElementById("StateList");
for(index in uniquestates) 
{
  select1.options[select1.options.length] = new Option(uniquestates[index]);
    
}

var select2 = document.getElementById("CountryList");
for(index in uniquecountries) 
{
  select2.options[select2.options.length] = new Option(uniquecountries[index]);
    
}

var select3 = document.getElementById("ShapeList");
for(index in uniqueshapes) 
{
  select3.options[select3.options.length] = new Option(uniqueshapes[index]);
    
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
  var filter_arr=[];
  let date = d3.select("#datetime").property("value").trim();
 
  let city1 = d3.select("#CityList").property("value").trim();
  
  let state1=d3.select("#StateList").property("value").trim();
  
  let country1=d3.select("#CountryList").property("value").trim();
  
  let shape1=d3.select("#ShapeList").property("value").trim();
  
  let filteredData = tableData;

  

  console.log(`${date}-${city1}--${state1}--${country1}--${shape1}`)
  if (date!="" && city1=="Select City" && state1=="Select State" && country1=="Select Country" && shape1=="Select Shape") 
  {    
    filteredData = filteredData.filter(row => row.datetime === date);
    console.log(`GOT IT  1!!!!!${filteredData}`);
  }
  else if (city1!="Select City" && date=="" && state1=="Select State" && country1=="Select Country" && shape1=="Select Shape") 
  {   
    console.log(`Came to cities`); 
    filteredData = filteredData.filter(row => row.city === city1);
    console.log(`GOT IT  2!!!!!${filteredData}`);
  }
  else if (state1!="Select State" && date=="" && city1=="Select City" && country1=="Select Country" && shape1=="Select Shape") 
  {    
    console.log(`Came to states`);
    filteredData = filteredData.filter(row => row.state === state1);
    console.log(`GOT IT  3!!!!!${filteredData}`);
  }
  else if (country1!="Select Country" && state1=="Select State" && date=="" && city1=="Select City" && shape1=="Select Shape") 
  {    
    filteredData = filteredData.filter(row => row.country === country1);
    console.log(`GOT IT  4!!!!!${filteredData}`);
  }
  else if (shape1!="Select Shape" && date=="" && city1=="Select City" && state1=="Select State" && country1=="Select Country") 
  {    
    filteredData = filteredData.filter(row => row.shape === shape1);
    console.log(`GOT IT  5!!!!!${filteredData}`);
  }
  else if (date!="" && city1!="Select City" && state1=="Select State" && country1=="Select Country" && shape1=="Select Shape" )
  {
    filteredData = filteredData.filter(row =>row.datetime === date && row.city === city1);
    console.log(`GOT IT  6!!!!!${filteredData}`);
  }
  else if (date!="" && city1!="Select City" && state1!="Select State" && country1=="Select Country" && shape1=="Select Shape" )
  {
    filteredData = filteredData.filter(row =>row.datetime === date && row.city === city1 && row.state === state1);
    console.log(`GOT IT  7!!!!!${filteredData}`);
  }
  else if (date!="" && city1!="Select City" && state1!="Select State" && country1!="Select Country" && shape1=="Select Shape" )
  {
    filteredData = filteredData.filter(row =>row.datetime === date && row.city === city1 && row.country === country1);
    console.log(`GOT IT  8!!!!!${filteredData}`);
  }
  else if (date!="" && city1!="Select City" && state1!="Select State" && country1!="Select Country" && shape1!="Select Shape" )
  {
    filteredData = filteredData.filter(row =>row.datetime === date && row.city === city1 && row.country === country1 && row.shape === shape1);
    console.log(`GOT IT  9!!!!!${filteredData}`);
  }
  table(filteredData);
}
d3.selectAll("#filter-btn").on("click", buttonClick);
table(tableData);



