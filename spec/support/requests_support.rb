module ValidUserRequestHelper
  def sign_in(user = nil)
    user ||= FactoryGirl.create :user
    post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end
end

RSpec.configure do |config|
  config.include ValidUserRequestHelper, :type => :request
end