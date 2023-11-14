class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:index, :create]
    before_action :set_comment, only: [:update, :destroy]

    def create

        @comment = Comment.new(user_id: current_user.id, post_id: @post.id, text: comment_params[:text])
        if @comment.save
            render json: @comment, status: :created
        else
            render json: { errors: @comment.errors }, status: :unprocessable_entity
        end

    end

    def index

        @comments = @post.comments
        render json: @comments

    end

    def update

        if @comment.update(comment_params)
            render json: @comment, status: :ok
        else
            render json: { errors: @comment.errors }, status: :unprocessable_entity
        end

    end

    def destroy

        if @comment.destroy
            render json: @comment, status: :ok
        else
            render json: { errors: @comment.errors }, status: :unprocessable_entity
        end

    end

    private

    def set_comment

        @comment = Comment.find(params[:comment_id])

    end

    def set_post

        @post = Post.find(params[:post_id])

    end

    def comment_params

        params.permit(
            :text
        )

    end
end
