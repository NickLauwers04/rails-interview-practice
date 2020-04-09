class Tenant < ActiveRecord::Base

  before_create :generate_api_key

  validates :name, :api_key, presence: true
  
  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end

end
