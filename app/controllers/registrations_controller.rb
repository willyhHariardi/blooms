class RegistrationsController < Devise::RegistrationsController
  before_action :require_no_authentication, only: :new
  def after_sign_up_path_for(resource)
    debugger
    sign_out resource
    new_admin_session_path # Or :prefix_to_your_route
  end
end