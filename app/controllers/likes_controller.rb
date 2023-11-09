class LikesController < ApplicationController

    def create

        @like = Like.new(like_params)
        if @like.save
            render json: @like
        else
            render json: { errors: @like.errors }, status: :created
        end

    end

    private

    def like_params

        params.permit(
            :user_id,
            :post_id
        )

    end
end
