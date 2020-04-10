FactoryBot.define do
	factory :tenant do
		name { FFaker::Company.name }
	end
end