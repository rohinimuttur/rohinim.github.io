var map = L.map('map');

L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}{r}.png', {
    attribution: '© OpenStreetMap contributors'
}).addTo(map);

L.Routing.control({
    waypoints: [
        L.latLng(40.710451, -73.960876),
        L.latLng(40.7431155537648, -73.9821535348892)
    ],
    routeWhileDragging: true
}).addTo(map);