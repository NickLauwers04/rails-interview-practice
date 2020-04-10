class AuthorizeApiRequest

	def initialize(headers = {})
		@headers = headers
	end

	def call
		{
			tenant: tenant
		}
	end

	private

	attr_reader :headers

	def tenant

		# Check if the tenant is in the database
		# Memoize tenant object
		@tenant ||= Tenant.find_by!(api_key: api_key) if api_key

	# Handle tenant not found
	rescue ActiveRecord::RecordNotFound => e

		# Raise custom error
		raise(
			ExceptionHandler::InvalidToken,
			("#{Message.invalid_token} #{e.message}")
		)
	end

	# Return api_key
  def api_key
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
      raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end