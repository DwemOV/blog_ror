class Devise::OmniauthCallbacksController < DeviseController

  def github
    # @users = sing_in? ? current_user : User.find_or_initialize_by(email: user_info[:email])
    create_provider_session
  end

  def facebook
    create_provider_session
  end

  private

  def create_provider_session
    @user = User.find_or_initialize_by(email: user_info[:email])

    @user.auth_providers.find_or_initialize_by(uid: auth_hash[:uid],
                                               provider: auth_hash[:provider])


    # @users.full_name = user_info[:name]
    @user.email = user_info[:email]
    @user.provider = auth_hash[:provider]
    @user.uuid = auth_hash[:uid]
    @user.avatar = user_info[:image]
    @user.save

    sign_in(@user)
    redirect_to root_path, notice: 'Welcome from GitHub'
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_info
    auth_hash[:info]
  end
end