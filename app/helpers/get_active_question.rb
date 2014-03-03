module GetQuestion
	def get_active_question
    today = Time.now.strftime("%Y-%m-%d")
    question = Question.find_by(date: today)
  end
end