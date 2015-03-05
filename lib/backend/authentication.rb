module Authentication
  UnauthenticatedError = Class.new(StandardError)

  def authenticate(params)
    @current_user = UserRepository.authenticate(params[:authentication_token])

    fail UnauthenticatedError if @current_user.nil?
  end

  def unauthorized(exception)
    self.format = :json
    self.body = '{}'
    self.status = 401
  end

  def self.included(base)
    base.before :authenticate
    base.send :handle_exception, UnauthenticatedError => :unauthorized
  end
end
