class PostsController < ApplicationController
  rescue_from Exception, :with => :error_render_method

	def index
		posts = Post.all
		if posts
			render :json => posts.to_json
		else
	     	render :json => {:message => "No posts"}
	    end
	end

	def create
		post = Post.create(create_post_params)
		if post
	      render :json => post.to_json, :status => :ok
		else
	      render :json => { :info => "No" }, :status => 401
		end
	end

	def show
	end

	def update
    post = Post.find_by_name(params[:id])
    if post.update_attributes(update_post_params)
        render :json => post.to_json, :status => :ok
    else
        render :json => { :info => "No" }, :status => 401
    end
	end

	def destroy
	end

  def error_render_method
    render :json => {:message => e.to_s}, :status => 500
  end

	private

	def create_post_params
		params.permit(:name)
	end

  def update_post_params
    params.permit(:name, :kudos)
  end
end




# HTTP Verb	Path	Controller#Action	Used for
# GET	/photos	photos#index	display a list of all photos
# GET	/photos/new	photos#new	return an HTML form for creating a new photo
# POST	/photos	photos#create	create a new photo
# GET	/photos/:id	photos#show	display a specific photo
# GET	/photos/:id/edit	photos#edit	return an HTML form for editing a photo
# PATCH/PUT	/photos/:id	photos#update	update a specific photo
# DELETE	/photos/:id	photos#destroy	delete a specific photo
