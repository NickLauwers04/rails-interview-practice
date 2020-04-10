class QuestionsController < ApplicationController

	# GET /questions
	def index
		@questions = Question.all
		json_response(@questions)
	end

	# GET /questions/:id
	def show
		@question = Question.find(params[:id])
		json_response(@question)
	end
end