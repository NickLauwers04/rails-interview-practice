require 'rails_helper'

RSpec.describe AuthorizeApiRequest do

	# Create tenant
	let(:tenant) { create(:tenant) }

	# Mock 'Authorization' header
	let(:header) { { 'Authorization' => tenant.api_key } }

	# Invalid request subject
	subject(:invalid_request_obj) { described_class.new({}) }

	# Valid request subject
	subject(:request_obj) { described_class.new(header) }

	# Test suite for AuthorizeApiRequest#call
	# This is our entry point into the service class
	describe '#call' do

		# Returns user object when request is valid
		context 'when valid request' do
			it 'returns tenant object' do
				result = request_obj.call
				expect(result[:tenant]).to eq(tenant)
			end
		end

		# Returns error message when invalid request
		context 'when invalid request' do

			context 'when missing token' do
				it 'raises a MissingToken error' do
					expect { invalid_request_obj.call }
						.to raise_error(ExceptionHandler::MissingToken, 'Missing token')
					end
				end
			end

			context 'when invalid token' do

				subject(:invalid_request_obj) do
					described_class.new('Authorization' => SecureRandom.hex(16) )
				end

				it 'raises an InvalidToken error' do
					expect { invalid_request_obj.call }
						.to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
					end
				end
			end
end