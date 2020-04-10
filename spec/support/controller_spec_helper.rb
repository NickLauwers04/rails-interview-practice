module ControllerSpecHelper

	# Return valid headers
	def valid_headers
		{
			"Authorization" => tenant.api_key,
			"Content-Type" => "application/json"
		}
	end

	# Return invalid headers
	def invalid_headers
		{
			"Authorization" => nil,
			"Content-Type" => "application/json"
		}
	end
end