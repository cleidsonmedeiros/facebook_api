class ImagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_image, only: [:destroy]

    def create

        @image = Image.new(image_params)
        if @image.save
            render json: @image, status: :created
        else
            render json: { errors: @person.errors }, status: :unprocessable_entity
        end

    end

    def destroy

        if @image.destroy
            render json: @image, status: :ok
        else
            render json: { errors: @image.errors }, status: :unprocessable_entity
        end

    end

    private

    def set_image

        @image = Image.find(params[:image_id])

    end

    def image_params

        params.permit(
            :url
        )

    end
end
