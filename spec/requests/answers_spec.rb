require 'rails_helper'

RSpec.describe 'Answers API' do
	
	# Initialize test data
	let!(:question) { create(:question) }
	let!(:answers) { create_list(:answer, 3, question_id: question.id) }
	let(:question_id) { question.id }

	# Test suite for GET /questions/:question_id/answers
	describe 'GET /questions/:question_id/answers' do

		before { get "/questions/#{question_id}/answers"}

		context 'when question exists' do

			it 'returns status code 200' do
				expect(response).to have_http_status(200)
			end

			it 'returns all answers' do
				expect(json.size).to eq(3)
			end
		end

		context 'when question does not exist' do

			let(:question_id) { 0 }

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end

			it 'returns a not found message' do
				expect(response.body).to match(/Couldn't find question/)
			end
		end
	end
end