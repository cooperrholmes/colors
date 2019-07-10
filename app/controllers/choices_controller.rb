class ChoicesController < ApplicationController

  def new
    @choice = Choice.new
    # @most_popular = Choice.where
    blue = Choice.where(color:"blue").count
    red = Choice.where(color:"red").count
    green = Choice.where(color:"green").count

    colors = [blue, red, green].sort
    print "*******************#{colors}*****************"
    @most_popular = colors.last
  end

  def create
    @choice = Choice.create(choice_params)
    redirect_to root_path
  end


  private

  def choice_params
    params.require(:choice).permit(:color)
  end

end
