class PostsController < ApplicationController
    before_action :set_post, except: [:create, :index]

    def index
        @post = Post.order(created_at: :desc)

        render json: @post
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            render json: @post, status: :created
        else
            render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy

        @post.destroy

    end

    def edit
        @post.update(post_params)

        if @post.save
            render json: @post
        else
            render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def set_post

        @post = Post.find(params[:id])

    end

    def post_params
        params.permit(
            :desc,
            :image_id
        )
    end

end