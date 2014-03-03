class ReceivetextController < ActionController::Base
	def receive_text
		phone = params["From"][2..-1]
		user = User.find_by(phone: phone)
		text = params["Body"]
		
		vote = Vote.new
		vote.save_the_vote(user, text)

		render nothing:true
	end


end