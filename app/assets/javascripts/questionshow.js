window.onload = function() {
		data = [
	{
		values: 2,
		color: '#F7464A'
	},
	{
		values: 4,
		color: '#e2eae9'
	}];
	var ctx = $("#canvas").get(0).getContext("2d");
	myNewChart = new Chart(ctx).Doughnut(data);

	
}