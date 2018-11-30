class ProfileController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  respond_to :json
  def index
  	@posts = current_user.posts.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end
end
