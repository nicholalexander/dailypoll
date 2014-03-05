window.onload = function() {

	

	console.log($("#myChart"))
	console.log(gon.yes_votes)
	console.log(gon.no_votes)
	// data = [
	// {
	// 	value: gon.no_votes,
	// 	color: "#F7464A"
	// },
	// {
	// 	value: gon.yes_votes,
	// 	color: "#E2EAE9"
	// }];



	// var ctx = $("#myChart").get(0).getContext("2d");
	// myNewChart = new Chart(ctx).Doughnut(data);


	var hash_keys = Object.keys(gon.question_hash)

	var hash_length = hash_keys.length

	for (var i = 0; i < hash_length; i++) {
		target_chart = hash_keys[i]
		ctx = $("#" + target_chart).get(0).getContext("2d");
		data = [
					{
						value: gon.question_hash[hash_keys[i]].yes,
						color: "#F7464A"
					},
					{
						value: gon.question_hash[hash_keys[i]].no,
						color: "#E2EAE9"
					}];
		index_charts = new Chart(ctx).Doughnut(data);
	}

}