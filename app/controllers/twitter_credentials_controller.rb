class TwitterCredentialsController < ApplicationController
  
  def create
    twitter_credentials = TwitterCredential.from_omniauth(env["omniauth.auth"])
    redirect_to root_path
  end

end
