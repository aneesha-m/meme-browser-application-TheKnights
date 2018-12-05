class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show]
  before_action :check_access, only: [:edit, :update, :destroy]
  respond_to :json
  # GET /posts
  # GET /posts.json
  def index
    # @posts = if params[:search]
    #   Post.where('title LIKE ?', "%#{params[:search]}%").order('id DESC')
    # else
    #   Post.all.order('id DESC')
    # end

    if params[:tag].present? and not params[:tag].nil?
      @posts_tagged = Post.tagged_with(params[:tag])
      if @posts_tagged.blank?
        #@posts = Post.all
        redirect_to root_path, notice: 'Invalid Search Tag'
      else
        if stale?(Post.all)
          @posts = @posts_tagged.paginate(page: params[:page], per_page: 5).order('created_at DESC')
        end
      end
    else
      if stale?(Post.all)
        @posts = Post.paginate(page: params[:page], per_page: 5).order('created_at DESC')
      end
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new if stale?(Post.all)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    if user_signed_in?
      @post = current_user.posts.new(post_params)
    else
      @post = Post.new(post_params)
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "successfully created post" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_back fallback_location: root_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :img, :all_tags, :tag)
    end


    def check_access
      @post = Post.find(params[:id])
      if current_user != @post.user
        respond_to do |format|
          format.html { redirect_to @post, notice: 'You are not authorized to make changes to this post' }
          format.json { render json: @post.errors, status: :unprocessable_entity}
        end
      end
    end
end