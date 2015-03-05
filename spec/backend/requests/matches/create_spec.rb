require 'spec_helper'

describe Web::Controllers::Matches::Create do
  include Rack::Test::Methods

  def app
    @app ||= Web::Application.new
  end

  it 'succeeds' do
    post app.routes.path(:create_match)
    assert last_response.ok?
  end
end
