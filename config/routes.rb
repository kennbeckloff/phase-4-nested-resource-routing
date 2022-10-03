Rails.application.routes.draw do
  resources :dog_houses, only: [:show]
  resources :reviews, only: [:show, :index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  def reviews_index
    dog_house = DogHouse.find(params[:dog_house_id])
    reviews = dog_house.reviews
    render json: reviews, include: :dog_house
  end

  def review
    review = Review.find(params[:id])
    render json: review, include: :dog_house
  endr
end
