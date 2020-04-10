class AnswersController < ApplicationController

	# GET /questions/:question_id/answers
	def index
		@question = Question.find(params[:question_id])
		json_response(@question.answers)
	end
end