class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, except: [:create, :index]

    def index

        @post = Post.order(created_at: :desc)
        render json: @post

    end

    def create

        @post = Post.new(post_params.except(:images))

        

        if @post.save

            image_urls = params[:post][:images]

            if image_urls
                image_urls.each do |image_url|

                    downloaded_image = URI.open(image_url)
                    
                    @post.images.attach(io: downloaded_image, filename: File.basename(downloaded_image.path))
                 end
            end

            render json: @post, status: :created
        else
            render json: { errors: @post.errors }, status: :unprocessable_entity
        end

    end

    def destroy

        if @post.destroy
            render json: @post, status: :ok
        else
            render json: { errors: @post.errors }, status: :unprocessable_entity
        end

    end

    def update

        @post.update(post_params)
        if @post.save
            render json: @post
        else
            render json: { errors: @post.errors }, status: :unprocessable_entity
        end

    end

    private

    def set_post

        @post = Post.find(params[:post_id])

    end

    def post_params

        params.permit(
            :desc,
            images: []
        )
        
    end

end