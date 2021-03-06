class PostCommentsController < ApplicationController
  before_action :authenticate_user!

	# コメント追加
	def create
		@post = Post.find(params[:post_id])
		@post_comment = PostComment.new(post_comment_params)
		@post_comment.post_id = @post.id
		@post_comment.user_id = current_user.id
		unless  @post_comment.save
			redirect_to post_path(@post), warning: "空のコメントはできません。"
		end
	end

	# コメント削除
	def destroy
		@post = Post.find(params[:post_id])
  	post_comment = @post.post_comments.find(params[:id])
		post_comment.destroy
	end

	private

	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end

end
