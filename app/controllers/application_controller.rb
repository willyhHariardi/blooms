class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Pagy::Backend
  before_action :count_cart

  def count_cart
    if user_signed_in?
      @cart_count = current_user.carts.count
    end
  end

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
      root_path
    end
  end
end
