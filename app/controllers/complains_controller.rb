class ComplainsController < ApplicationController
  def show
    @complain = Complain.find(params[:id])
  end

  def index
    @complains = Complain.all
  end
end
