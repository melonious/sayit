class CruelsController < ApplicationController
  def index
    @cruels = current_user.cruels.all
  end

  def show
    @cruel = Cruel.find(params[:id])
  end

  def new
    @cruel = current_user.cruels.new
  end

  def edit
    @cruel = Cruel.find(params[:id])
  end

  def create
    @cruel = current_user.cruels.new(cruel_params)

    if @cruel.save
      redirect_to @cruel
    else
      render 'new'
    end
  end

  def update
    @cruel = Cruel.find(params[:id])

    if @cruel.update(cruel_params)
      redirect_to @cruel
    else
      render 'edit'
    end
  end

  def destroy
    @cruel = Cruel.find(params[:id])
    @cruel.destroy

    redirect_to cruels_path
  end

  private

  def cruel_params
    params.require(:cruel).permit(:message)
  end
end
