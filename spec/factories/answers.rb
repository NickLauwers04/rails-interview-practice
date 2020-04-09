FactoryBot.define do
	factory :answer do
		body        { FFaker::Lorem.paragraph }
		user_id     { FFaker::Number.number(10) }
		question_id { nil }
	end
end