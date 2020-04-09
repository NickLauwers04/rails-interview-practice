require 'rails_helper'

RSpec.describe 'Questions API', type: :request do
	
	# Initialize test data
	let!(:questions) { create_list(:question, 10) }
	let(:question_id) { questions.first.id }

	# Test suite for GET /questions
	describe 'GET /questions' do

		before { get '/questions' }

		it 'returns questions' do
			expect(json).not_to be_empty
			expect(json.size).to eq(10)
		end

		it 'returns status code 200' do
			expect(response).to have_http_status(200)
		end
	end

	# Test suite for GET /questions/:id
	describe 'GET /questions/:id' do

		before { get "/questions/#{question_id}" }

		context 'when the record exists' do

			it 'returns the question' do
				expect(json).not_to be_empty
				expect(json['id']).to eq(question_id)
			end

			it 'returns status code 200' do
				expect(response).to have_http_status(200)
			end
		end

		context 'when the record does not exist' do

			let(:question_id) { 100 }

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end

			it 'returns a not found message' do
				expect(response.body).to match(/Couldn't find Question/)
			end
		end
	end
end