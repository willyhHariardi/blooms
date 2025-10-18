class GoogleLoginForm
  include ActiveModel::Model

  attr_accessor :user, :flash_params

  validates :flash_params, presence: true
  validate :validate_flash_params, if: -> { flash_params.present? }

  def initialize(flash_params)
    @flash_params = flash_params
    @user = nil
  end

  def submit
    return false if invalid?

    authenticate_with_google

    errors.blank?
  end

  private

  def validate_flash_params
    if flash_params[:google_sign_in].blank?
      errors.add(:base, 'invalid flash parameters')
      return
    end

    flash_error = flash_params[:google_sign_in][:error]
    errors.add(:base, flash_error) if flash_error.present?
  end

  def authenticate_with_google
    id_token = flash_params[:google_sign_in]["id_token"]
    google_data = GoogleSignIn::Identity.new(id_token)
    assign_user(google_data)
  end

  def assign_user(google_data) # rubocop:disable Metrics/AbcSize
    @user = User.find_by(email: google_data.email_address.strip.downcase) || User.new
    @user.email = google_data.email_address
    @user.name = google_data.name
    @user.avatar_url = google_data.avatar_url
    @user.password = User.default_password unless @user.persisted?
    @user.google_id = google_data.user_id

    errors.add(:admin, @user.errors.full_messages.to_sentence) unless @user.save
  end
end
