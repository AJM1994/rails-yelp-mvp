class ReviewsController < ApplicationController

  def index
    @reviews = Review.where(restaurant_id: @restaurant)
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to @restaurant, notice: "Review was succesfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @restaurant, notice: "Review was sucessfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to restaurants_url, notice: "Review was successfully destroyed"
  end

  def review_params
    params.require(:review).permit(:rating,:content)
  end
end
