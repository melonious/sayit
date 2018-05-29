class KindsController < ApplicationController
  def index
    @kinds = current_user.kinds.all
  end

  def show
    @kind = Kind.find(params[:id])
  end

  def new
    @kind = current_user.kinds.new
  end

  def edit
    @kind = Kind.find(params[:id])
  end

  def create
    @kind = current_user.kinds.new(kind_params)

    if @kind.save
      redirect_to @kind
    else
      render 'new'
    end
  end

  def update
    @kind = Kind.find(params[:id])

    if @kind.update(kind_params)
      redirect_to @kind
    else
      render 'edit'
    end
  end

  def destroy
    @kind = Kind.find(params[:id])
    @kind.destroy

    redirect_to kinds_path
  end

  private

  def kind_params
    params.require(:kind).permit(:message)
  end

end
