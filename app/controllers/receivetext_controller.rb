class ReceivetextController < ActionController::Base
	def receive_text

		phone = params["From"][2..-1]
		user = User.find_by(phone: phone)
		text = params["Body"]
		
		vote = Vote.new
		vote.save_the_vote(user, text)

		response_text = "Thanks for participating, your vote has been recorded."

		Sms.new.send_text_message(phone, response_text)

		render nothing:true
	end

	def voice_response
		phone = params["From"][2..-1]
		user = User.find_by(phone: phone)
		if user.nil?
			name = "friend"
		else
			name = user.name
		end
		response = Twilio::TwiML::Response.new do |r|
    	r.Say "Hello, #{name}. This is a daily polling app. We hope you enjoy our questions.", :voice => 'woman', :language => 'fr-FR'
   			r.Play "http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3"
    end
    render text: response.text
	end


end