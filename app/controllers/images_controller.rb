class ImagesController < ApplicationController
    def create
        @image = Image.new(image_params)

        if @image.save
            render json: @image, status: :created
        else
            render json: { errors: @person.errors }, status: :unprocessable_entity
        end

    end

    private

    def image_params
        params.permit(
            :url
        )
    end
end
