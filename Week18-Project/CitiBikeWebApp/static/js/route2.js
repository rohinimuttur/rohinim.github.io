var streetmap = L.tileLayer("https://api.mapbox.com/styles/v1/mapbox/light-v9/tiles/256/{z}/{x}/{y}?access_token={accessToken}", {
    attribution: "Map data &copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"http://mapbox.com\">Mapbox</a>",
    maxZoom: 18,
    id: "mapbox.light",
    accessToken: 'pk.eyJ1Ijoicm9oaW5pbXV0dHVyIiwiYSI6ImNqdmU4eXE4bzFzZGU0NG5tYTlvYWVidHMifQ.vMkdIDvIVNdEnruihk-XoQ'
  });

  // Create a baseMaps object to hold the lightmap layer
  var baseMaps = {
    "Street Map": streetmap
  };

 

  // Create the map object with options
  var map = L.map("map", {
    center: [40.73, -74.0059],
    zoom: 5,
    layers: [streetmap]
  });




  L.Routing.control({
    waypoints: [
        L.latLng(40.710451, -73.960876),
        L.latLng(40.7431155537648, -73.9821535348892)
    ],
    routeWhileDragging: true,
    
}).addTo(map);







