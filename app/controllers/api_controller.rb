class ApiController < ApplicationController
  def show
    @greetings = Greeting.all
    @greeting = @greetings[Random.rand(0...@greetings.size - 1)]
    respond_to do |format|
      format.html { render plain: "<h1>#{@greeting.greeting}</h1" }
      format.json { render json: @greeting }
    end
  end

end
