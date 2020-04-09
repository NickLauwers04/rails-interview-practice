FactoryBot.define do
	factory :answer do
		body        { FFaker::Lorem.paragraph }
		user_id     { rand(1..10) }
		question_id { nil }
	end
end