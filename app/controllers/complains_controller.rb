class ComplainsController < ApplicationController
  def new
  end

  def show
    @complain = Complain.find(params[:id])
  end

  def index
    @complains = Complain.all
  end
end
