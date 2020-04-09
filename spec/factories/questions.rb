FactoryBot.define do
	factory :question do
		title      { FFaker::HipsterIpsum.sentence.gsub(/\.$/, "?") }
		user_id    { rand(1..10) }
		is_private { false }
	end
end