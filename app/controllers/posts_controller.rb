class PostsController < ApplicationController

    def index
        @post = Post.all

        render json: @post
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            render json: @post, status: :created
        else
            render json: { errors: @person.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def post_params
        params.permit(
            :desc,
            :image_id
        )
    end

end