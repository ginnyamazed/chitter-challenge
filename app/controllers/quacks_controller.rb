# frozen_string_literal: true

class QuacksController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_quack, only: %i[show edit update destroy]


  # GET /quacks or /quacks.json
  def index
    @quacks = Quack.all.sort.reverse
  end

  # GET /quacks/1 or /quacks/1.json
  def show; end

  # GET /quacks/new
  def new
    @quack = Quack.new
  end

  # GET /quacks/1/edit
  def edit; end

  # POST /quacks or /quacks.json
  def create
    @quack = Quack.new(quack_params)

    respond_to do |format|
      if @quack.save
        format.html { redirect_to quacks_path, notice: 'Quack was successfully created.' }
        format.json { render :show, status: :created, location: @quack }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quacks/1 or /quacks/1.json
  def update
    respond_to do |format|
      if @quack.update(quack_params)
        format.html { redirect_to quack_url(@quack), notice: 'Quack was successfully updated.' }
        format.json { render :show, status: :ok, location: @quack }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quacks/1 or /quacks/1.json
  def destroy
    @quack.destroy

    respond_to do |format|
      format.html { redirect_to quacks_url, notice: 'Quack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quack
    @quack = Quack.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def quack_params
    params.require(:quack).permit(:content, :tagged_users, :user_id)
  end
end
