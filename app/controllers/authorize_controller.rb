class AuthorizeController < ApplicationController
  def start
    redirect_to OAuthClientFacebook.web_server.authorize_url(
      :redirect_uri => auth_callback_url,
      :scope => 'email,offline_access,publish_stream'
    )
  end

  def callback
    access_token = OAuthClientFacebook.web_server.access_token(
      params[:code], :redirect_uri => auth_callback_url
    )
    @user = FacebookUser.create_from_fb(access_token)
   # Thread.current[:user] = @user
   # @user.post("Success! Connected with wellnessify.")
   # config.action_controller.session = { :key => "_myapp_session"
   session[:global_user] = @user
   #session[:global_user].nil?

  end

#  class UserSession < Authlogic::Session::Base
#    oauth2_client_id      "APPLICATION_ID"
#    oauth2_client_secret  "APPLICATION_SECRET"
#    oauth2_site           "https://graph.facebook.com"
#    oauth2_scope          "offline_access,email,user_birthday"
#  end


  def oauth_start
    redirect_to OAuthClientFacebook.web_server.authorize_url(
      :redirect_uri => twitter_auth_callback_url,
      :scope => 'email,offline_access,publish_stream'
    )
  end

  def oauth_callback
    access_token = OAuthClientFacebook.web_server.access_token(
      params[:code], :redirect_uri => twitter_auth_callback_url
    )
    @user = FacebookUser.create_from_fb(access_token)
   # Thread.current[:user] = @user
   # @user.post("Success! Connected with wellnessify.")
   # config.action_controller.session = { :key => "_myapp_session"
   session[:global_user] = @user
   #session[:global_user].nil?

  end

end
