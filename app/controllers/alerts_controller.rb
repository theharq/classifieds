class AlertsController < ApplicationController
  def new
    @alert = Alert.new
  end

  def create
    @alert = Alert.new(params[:alert])
    if @alert.save
      redirect_to root_path, notice: "Alerta creada sin problemas"
    else
      render 'new', error: "Error, por favor verifica los datos ingresados"
    end
  end
end
