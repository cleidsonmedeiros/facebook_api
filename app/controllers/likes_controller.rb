class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:liked_post, :liked_comment, :likes_count_post, :likes_count_comment]
    before_action :set_comment, only: [:liked_comment, :likes_count_comment]

    def liked_post

        @like = Like.new(user_id: current_user.id, post_id: @post.id)
        if @like.save
            render json: @like
        else
            render json: { errors: @like.errors }, status: :unprocessable_entity
        end

    end

    def liked_comment

        @like = Like.new(user_id: current_user.id, post_id: @post.id, comment_id: @comment.id)
        if @like.save
            render json: @like
        else
            render json: { errors: @like.errors }, status: :unprocessable_entity
        end

    end

    def likes_count_post

        @like_count = Like.where(comment_id: nil).count

        render json: @like_count

    end

    def likes_count_comment

        @like_count = Like.where(post_id: @post.id, comment_id: @comment.id).where.not(comment_id: nil).count

        render json: @like_count

    end

    def destroy

        if @like.destroy
            render json: @like, status: :ok
        else
            render json: { errors: @like.errors }, status: :unprocessable_entity
        end

    end

    private

    def set_comment

        @comment = Comment.find(params[:comment_id])

    end

    def set_post

        @post = Post.find(params[:post_id])

    end

end
