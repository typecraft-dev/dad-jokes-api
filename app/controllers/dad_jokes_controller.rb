class DadJokesController < ApplicationController
  def index
    @dad_jokes = Queries::DadJokeQuery.new.query
    render json: @dad_jokes
  end

  def create
    @dad_joke = DadJoke.new(dad_joke_params)
    if @dad_joke.save!
      render json: @dad_joke, status: :created
    else
      render(
        json: { error: @dad_joke.errors.full_messages },
        status: :unprocessable_entity
      )
    end
  end

  private

  def dad_joke_params
    params[:dad_joke].permit(:joke_text, :cringe_level, :question)
  end
end
