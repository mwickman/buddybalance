module SessionsHelper
  def sign_in( buddy )
    cookies.permanent[:remember_token] = buddy.remember_token
    current_buddy = buddy
  end

  def signed_in?
    !current_buddy.nil?
  end

  def current_buddy=(buddy)
    @current_buddy = buddy
  end

  def current_buddy
    @current_buddy ||= Buddy.find_by_remember_token(cookies[:remember_token])
  end

  def current_buddy? buddy
    buddy == current_buddy
  end

  def sign_out
    current_buddy = nil
    cookies.delete(:remember_token)
  end
end
