class PostsController < ApplicationController
	
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

	# PUT /posts/1/like
	def like
		@post = Post.find(params[:id])

    respond_to do |format|      
			format.js do
				@post.like += 1
				@post.save
			end
    end
	end
	
	# PUT /posts/1/add_comment
	
	def add_comment
		@post = Post.find(params[:id])
		respond_to do |format|   
			format.js do 
				@comment = Comment.new(author: params[:comment][:author], content: params[:comment][:content])
				@comment.post = @post
				@comment.save
			end
		end
	end
	
  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }				
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
			
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
	
	def mercury_update		
		@post = Post.find(params[:id])
		
		@post.title = params[:content][:post_title][:value]	if !params[:content][:post_title].nil?
		@post.content = params[:content][:post_content][:value]	if !params[:content][:post_content].nil?	 
		@post.save!
		
		render text: ""
		#redirect_to @post, notice: 'Post was successfully updated.' 
	end
	
	def mercury_new
		title = params[:content][:post_title][:value]	if !params[:content][:post_title].nil?
		content = params[:content][:post_content][:value]	if !params[:content][:post_content].nil?	 
		
		@post = Post.new(title: title, content: content)
		@post.save!
		
		render text: @post.id
	end
end
