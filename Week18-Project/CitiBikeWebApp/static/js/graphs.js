
queue()
	.defer(d3.json, "/data")
	.await(makeGraphs);

function makeGraphs(error, projectsJson) {
	
	var bikeprojects = projectsJson;
	//console.log(bikeprojects)
	var dateFormat = d3.time.format("%Y-%m");
	bikeprojects.forEach(function(d) 
	{
		d["yearofride"] = dateFormat.parse(d["yearofride"]);


		
	});
	
	function reduceAdd(p, v) {
		p.worth = p.worth + v.worth;
		p.count = p.count + 1;
		return p;
	 }
	
	 var ndx = crossfilter(bikeprojects);
	 
	 var genderDim = ndx.dimension(function(d){ return d["gender"]; })
	 var genderGroup = genderDim.group();
		
	 console.log(genderGroup)
	 var genderChart = dc.rowChart("#gender-row-chart");

	 var ageDim=ndx.dimension(function(d) { return d["age"]; })
	 var ageGroup = ageDim.group();	
	 var ageChart = dc.pieChart("#age-segment-row-chart");

	 var calDim=ndx.dimension(function(d) { return d["Time_day"]})
	 //var calDim2=ndx.dimension(function(d) { return d["calories_burned"]  + '-' +d["gender"]})	 
	 var calGroup = calDim.group();
	 var calChart = dc.rowChart("#cal-segment-row-chart");


	 

	 var startStnDim=ndx.dimension(function(d) { return d["start station name"] })	
	 console.log(startStnGroup)
	 var startStnGroup = startStnDim.group();
	 console.log(startStnGroup)	 
	 var startStnChart = dc.rowChart("#location-row-chart");


	 var endStnDim=ndx.dimension(function(d) { return  d["end station name"];})	
	 var endStnGroup = endStnDim.group();
	 console.log(endStnGroup.size)	 
	 var endStnChart = dc.rowChart("#location-row-chart-2");


	 var dateDim = ndx.dimension(function(d) { return d["yearofride"]; });
	 var numRecordsByDate = dateDim.group();
	 var timeChart = dc.barChart("#time-chart");
	 var minDate = dateDim.bottom(1)[0]["yearofride"];
	 var maxDate = dateDim.top(1)[0]["yearofride"];
	 console.log(`${minDate}--${maxDate}`);
	 console.log(numRecordsByDate)


	 var allDim = ndx.dimension(function(d) {return d;});
	 var all = ndx.groupAll();
	 var numberRecordsND = dc.numberDisplay("#number-records-nd");


	

  genderChart
	.width(300)
	.height(100)
	.dimension(genderDim)
	.group(genderGroup)
	.ordering(function(d) { return -d.value })
	.colors(d3.scale.ordinal().range(['lightblue']))
	.elasticX(true)
	.xAxis().ticks(4);


	ageChart		
		.width(270)
		.height(250)		
		.innerRadius(50) 				
        .dimension(ageDim)
		.group(ageGroup)				
		.legend(dc.legend())
        
		;
		
	calChart
		.width(350)
		.height(410)	
		.x(d3.scale.linear().domain([0,1000]).range([0, 1000]))		
		.dimension(calDim)
		.group(calGroup)
		.ordering(function(d) { return -d.key })
		//.colors(['#6baed6'])		
		.elasticX(true)
		.xAxis().ticks(4);

		
	startStnChart
			.width(300)
			.height(15000)					
		    .dimension(startStnDim)
		    .group(startStnGroup)
			.ordering(function(d) { return -d.value })				
			.colors(['#6baed6'])	    
		    .elasticX(true)
		    .labelOffsetY(10)
			.xAxis().ticks(4);
	endStnChart
			.width(300)
			.height(15000)
			.x(d3.scale.linear().domain([15,100]))
		    .dimension(endStnDim)
		    .group(endStnGroup)
		    .ordering(function(d) { return -d.value })
		    .colors(['#6baed6'])
		    .elasticX(true)
		    .labelOffsetY(10)
			.xAxis().ticks(4);
	timeChart
			.width(850)
			.height(150)
			.margins({top: 10, right: 50, bottom: 20, left: 20})
			.dimension(dateDim)
			.group(numRecordsByDate)
			.transitionDuration(500)
			.x(d3.time.scale().domain([minDate, maxDate]))
			.elasticY(true)
			.yAxis().ticks(4);

	numberRecordsND
			.formatNumber(d3.format("d"))
			.valueAccessor(function(d){return d; })
			.group(all);
	
	///----- Code for Map-----------------------
		
	var map = L.map('map');

	var drawMap = function(){

	    map.setView([40.73, -74.0059], 11);
		mapLink = '<a href="http://openstreetmap.org">OpenStreetMap</a>';
		L.tileLayer(
			'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
				attribution: '&copy; ' + mapLink + ' Contributors',
				maxZoom: 15,
				id: "mapbox.streets",
			}).addTo(map);
		
		
		//HeatMap
		var geoData = [];
		_.each(allDim.top(Infinity), function (d) {
			geoData.push([d["start station latitude"], d["start station longitude"], 1]);
	      });
		var heat = L.heatLayer(geoData,{
			radius: 10,
			blur: 20, 
			maxZoom: 5,
		}).addTo(map);

	};

	//Draw Map
	drawMap();

	//Update the heatmap if any dc chart get filtered
	dcCharts = [genderChart,ageChart,startStnChart,endStnChart,timeChart,timeChart];

	_.each(dcCharts, function (dcChart) {
		dcChart.on("filtered", function (chart, filter) {
			map.eachLayer(function (layer) {
				map.removeLayer(layer)
			}); 
			drawMap();
		});
	});

	dc.renderAll();
};

	
	
	  


