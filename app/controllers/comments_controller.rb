class CommentsController < ApplicationController
    before_action :set_post, except: [:create, :update]
    before_action :set_comment, only: [:update, :destroy]

    def create

        @comment = Comment.new(comment_params)

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

        if @comment.update(text: params[:text])
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
            :user_id,
            :post_id,
            :text
        )

    end
end
