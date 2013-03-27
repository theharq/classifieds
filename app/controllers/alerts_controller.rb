class AlertsController < ApplicationController
  def new
    @alert = Alert.new
    render layout: false
  end

  def create
    @alert = Alert.new(params[:alert])
    if @alert.save
      flash.now[:notice] = "Alerta creada exitosamente"
    else
      flash.now[:error] = @alert.errors.full_messages
    end
  end
end
