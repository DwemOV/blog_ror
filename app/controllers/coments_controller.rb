class ComentsController < ApplicationController

  def index
  end

  def new
  end

  def update
    set_coment
    respond_to do |format|
    @coment.user_id = current_user.id
      if @coment.update(coment_params)
        format.html { redirect_to @item }
        format.json { render :show, status: :ok, location: @coment }
      else
        format.html { render :edit }
        format.json { render json: @coment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    set_coment
  end

  def likes
    current_user.like!(Coment.find_by(id: params[:coment_id]))
    respond_to do |format|
      format.html { redirect_to item_path(params[:item_id])}
      # format.js
    end

  end

  def unlikes
     current_user.unlike!(Coment.find_by(id: params[:coment_id]))
     respond_to do |format|
       format.js
       format.html {redirect_to item_path(params[:item_id])}
     end
  end

  def create
    set_coment
    @coment = @item.coments.create(coment_params)
    @coment.user_id = current_user.id
    respond_to do |format|
      if @coment.save
        # format.js
        format.html { redirect_to @item, notice: 'coment was successfully created.' }
        format.json { render :show, status: :created, location: @coment}
      else
        # format.js
        format.html { render :new }
        format.json { render json: @coment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end


  def destroy
    set_coment
    @coment.destroy
     respond_to do |format|
       format.html { redirect_to @item }
       format.json { head :no_content }
     end
  end

  private


  # Never trust parameters from the scary internet, only allow the white list through.
  def coment_params
    params.require(:coment).permit(:item, :users, :description)
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def set_coment
    @item = Item.find(params[:item_id])
    @coment =  @item.coments.find_by(id: params[:id])
  end
end
