class ReviewsController < ApplicationController
  def new
    # you need the restaurant id in order to write a review
    @restaurant = Restaurant.find(params[:restaurant_id])
    # to new display the form
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end

  end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
