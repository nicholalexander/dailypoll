class Sms

	def initiate_delayed_jobs
		question = Question.active
		if question == nil
			puts "no question"
		else
			send_question(question)
		end
	end



	def send_question(question)
		users = User.all
		text = question.text
		text = text + " (Please answer Yes or No)"
		users.each do |user|
			phone_number = user.phone
			send_text_message(phone_number, text)
		end
	end



	def send_text_message(phone_number, text)
		twilio_sid = "AC9f40d593b23b1e39ec6d4b52373422a4"
		twilio_token = "b41c662e309b69a2823a6b9c11f8a0fe"
		twilio_phone_number = "9177467444"

		@twilio_client = Twilio::REST::Client.new( twilio_sid, twilio_token )

  	@twilio_client.account.sms.messages.create(
    	:from => "+1#{twilio_phone_number}",
    	:to => phone_number,
    	:body => "#{text}"
  		)
	end

end