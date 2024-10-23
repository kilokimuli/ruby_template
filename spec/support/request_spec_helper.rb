# spec/support/request_spec_helper.rb
module RequestSpecHelper
  def sign_in_user(user)
    sign_in(user)  # Provided by Devise::Test::IntegrationHelpers
  end

  def sign_out_user
    sign_out(:user)  # Provided by Devise::Test::IntegrationHelpers
  end

  def json
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper, type: :request
end
