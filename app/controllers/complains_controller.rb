class ComplainsController < ApplicationController
  def new
    @ip_address = request.env['HTTP_X_FORWARDED_FOR'];
    @complain = Complain.new
  end

  def create
    @complain = Complain.new(allowed_params)
    @complain.maybe_fraud = false;

    if @complain.save
      redirect_to root_url, notice: 'Agradeço o envio!'
    else
      redirect_to root_path
    end
  end

  def show
    @complain = Complain.find(params[:id])
  end

  def index
    @complains = Complain.all
  end

  private

  def allowed_params
    params.require(:complain).permit!
  end

end
