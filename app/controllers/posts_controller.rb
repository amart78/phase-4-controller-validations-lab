class PostsController < ApplicationController
# Change PostsController#update to send back the error messages if the updated post is invalid

# ------------
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
# ------------

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

# ------------
  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end 

  def render_not_found_response
    render json: { error: "Post not found" }, status: :not_found
  end
  # had to remove .full_messages from {errors: invalid.record.errors.full_messages}
# ------------

end
