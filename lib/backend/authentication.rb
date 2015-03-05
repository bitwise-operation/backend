module Authentication
  def authenticate(params)
    @current_user = UserRepository.authenticate(params[:authentication_token])
  end
end
