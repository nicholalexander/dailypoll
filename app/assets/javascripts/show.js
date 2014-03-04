window.onload = function() {

	

	console.log($("#myChart"))
	console.log(gon.yes_votes)
	console.log(gon.no_votes)
	data = [
	{
		value: gon.no_votes,
		color: "#F7464A"
	},
	{
		value: gon.yes_votes,
		color: "#E2EAE9"
	}];



	var ctx = $("#myChart").get(0).getContext("2d");
	myNewChart = new Chart(ctx).Doughnut(data);
}