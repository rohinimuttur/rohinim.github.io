queue()
    .defer(d3.json, "/citibike/info")
    .defer(d3.json, "static/geojson/us-states.json")
    .await(makeGraphs);

function makeGraphs(error, projectsJson, statesJson) {
	
	var bikeprojects = projectsJson;

	var ndx = crossfilter(bikeprojects);
	var tripDurationDim = ndx.dimension(function(d) { return d["tripduration"]; })
	var avgTripDuration = tripDurationDim.group();
	
	var tripTimeChart = dc.rowChart("#resource-type-row-chart");

	tripTimeChart
	.width(300)
	.height(250)
	.dimension(resourceTypeDim)
	.group(avgTripDuration)
	.xAxis().ticks(4);

};