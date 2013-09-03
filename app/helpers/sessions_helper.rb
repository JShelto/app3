module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    user = current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
     @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
    redirect_to signin_path
  end

  def user_finder 
    if(params[:session])
      @user = User.find_by_email(params[:session][:email])
    else
      auth = request.env["omniauth.auth"]
      @user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    end
  end



end
