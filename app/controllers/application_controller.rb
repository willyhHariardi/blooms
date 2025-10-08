class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if admin_signed_in?
      home_dashboard_path
    else 
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope.eql?(:admin)
      admin_session_path
    else 
      new_admin_user_session_path
    end
  end
end
