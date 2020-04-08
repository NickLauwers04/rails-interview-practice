require 'rails_helper'

RSpec.describe User, type: :model do
	it { should have_many(:questions).inverse_of(:asker).dependent(:destroy) }
	it { should have_many(:answers).inverse_of(:answerer).dependent(:destroy) }
	it { should validate_presence_of(:name) }
end