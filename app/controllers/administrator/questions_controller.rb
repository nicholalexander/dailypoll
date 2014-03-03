class Administrator::QuestionsController < Administrator::BaseController



	def create
		question = Question.create(question_params)
		send_text_message(question)
		redirect_to administrator_path
	end


	private
		def question_params
			params.require(:question).permit(:text, :date)
		end

		def send_text_message(question)
			phone_number = "9175123511"
			twilio_sid = "AC9f40d593b23b1e39ec6d4b52373422a4"
			twilio_token = "b41c662e309b69a2823a6b9c11f8a0fe"
			twilio_phone_number = "9177467444"

			@twilio_client = Twilio::REST::Client.new( twilio_sid, twilio_token )

    	@twilio_client.account.sms.messages.create(
      	:from => "+1#{twilio_phone_number}",
      	:to => phone_number,
      	:body => "#{question.text}. It gets sent to #{phone_number}"
    		)
  	end
end