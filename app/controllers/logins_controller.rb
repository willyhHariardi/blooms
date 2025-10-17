# app/controllers/logins_controller.rb
class LoginsController < ApplicationController
  def new
  end

  def create
    debugger
     form = GoogleLoginForm.new(flash)
    if user = authenticate_with_google
      cookies.signed[:user_id] = user.id
      redirect_to user
    else
      redirect_to new_session_url, alert: 'authentication_failed'
    end
  end

  private
    def authenticate_with_google
      id_token =  flash[:google_sign_in]["id_token"]
      identity =  GoogleSignIn::Identity.new(id_token)

      if identity.valid?
        User.find_by google_id: GoogleSignIn::Identity.new(id_token).user_id
      elsif error = flash[:google_sign_in][:error]
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
end