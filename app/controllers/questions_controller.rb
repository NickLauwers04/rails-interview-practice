class QuestionsController < ApplicationController

	before_action :set_question, only: :show

	# GET /questions
	def index
		@questions = Question.all
		json_response(@questions)
	end

	# GET /questions/:id
	def show
		json_response(@question)
	end

	private

	def set_question
		@question = Question.find(params[:id])
	end
end