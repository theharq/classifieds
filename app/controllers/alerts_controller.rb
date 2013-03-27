class AlertsController < ApplicationController
  def index
    render layout: false
  end

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

  def edit
    @alert = Alert.find(params[:id])
    render layout: false
  end

  def update
    @alert = Alert.find(params[:id])
    if @alert.update_attributes(params[:alert])
      flash.now[:notice] = "Alerta actualizada exitosamente"
    else
      flash.now[:error] = @alert.errors.full_messages
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    if @alert.destroy
      flash.now[:error] = "Alerta Eliminada"
    else
      flash.now[:error] = @alert.errors.full_messages
    end
  end

  def search
    @alert = Alert.find_by_email(params[:email])
    flash.now[:error] = "No existes alertas" if @alert.nil?
  end
end
