// from data.js
let tableData = data;

// YOUR CODE HERE!
let tbody=d3.select("tbody");

function createtable(data) 
{
  data.forEach((item)=>
  {
        let row=tbody.append("tr");
        Object.values(item).forEach((val)=>
        {
            let ufoitem=row.append("td");
            ufoitem.text(val);
        });
  });
}


function buttonClick() 
{

    d3.event.preventDefault();
    let btnelement = d3.select("#datetime").property("value");
    let filteredData=data;

    if(btnelement)
    {
        filteredData = filteredData.filter(row => row.datetime === btnelement);
    }

     createtable(filteredelement);
     
}  // from data.js



//d3.selectAll("#filter-btn").on("click", buttonClick);
d3.selectAll("#filter-btn").on("click", buttonClick);
createtable(tableData);




