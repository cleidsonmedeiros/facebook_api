class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, :set_post, only: [:create]

    def create

        @like = Like.new(user_id: @user.id, post_id: @post.id)
        if @like.save
            render json: @like
        else
            render json: { errors: @like.errors }, status: :unprocessable_entity
        end

    end

    def destroy

        if @like.destroy
            render json: @like, status: :ok
        else
            render json: { errors: @like.errors }, status: :unprocessable_entity
        end

    end

    private

    def set_user

        @user = User.find(params[:user_id])

    end

    def set_post

        @post = Post.find(params[:post_id])

    end

end
