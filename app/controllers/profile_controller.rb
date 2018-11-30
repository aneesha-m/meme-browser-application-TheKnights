class ProfileController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json
  before_action :authenticate_user!
  def index
  	@posts = current_user.posts
  end
end
