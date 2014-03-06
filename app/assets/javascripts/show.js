window.onload = function() {
	console.log(gon.question_hash)
	console.log("yes")


	var hash_keys = Object.keys(gon.question_hash)

	var hash_length = hash_keys.length

	for (var i = 0; i < hash_length; i++) {
		target_chart = hash_keys[i]
		ctx = $("#" + target_chart).get(0).getContext("2d");
		data = [
					{
						value: gon.question_hash[hash_keys[i]].yes,
						color: "#FAFC37",
						label: 'yes'
					},
					{
						value: gon.question_hash[hash_keys[i]].no,
						color: "#E2EAE9",
						label: 'no'
					}];
		index_charts = new Chart(ctx).Doughnut(data);
	}

	var size_li = $(".indexresultsbox").size();
  var x=3;
  $('.indexresultsbox:lt('+x+')').css({"display":"inline-block"});

	$(window).scroll(function() {
    if($(window).scrollTop() >= $(document).height() - ($(window).height()+0)){
        x= (x+1 <= size_li) ? x+1 : size_li;
      $('.indexresultsbox:lt('+x+')').fadeIn();
      $('.indexresultsbox:lt('+x+')').css({"display":"inline-block"})
    
      if (x >= size_li){
        $(this).hide();

      }

      return false;
    }
});

}