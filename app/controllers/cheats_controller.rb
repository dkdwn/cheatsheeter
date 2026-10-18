class CheatsController < ApplicationController
  before_action :set_cheat, only: %i[ show edit update destroy ]

  # GET /cheats or /cheats.json
  def index
    @cheats = Cheat.all
  end

  # GET /cheats/1 or /cheats/1.json
  def show
  end

  # GET /cheats/new
  def new
    @cheat = Cheat.new
  end

  # GET /cheats/1/edit
  def edit
  end

  # POST /cheats or /cheats.json
  def create
    @cheat = Cheat.new(cheat_params)

    respond_to do |format|
      if @cheat.save
        format.html { redirect_to @cheat, notice: "Cheat was successfully created." }
        format.json { render :show, status: :created, location: @cheat }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @cheat.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /cheats/1 or /cheats/1.json
  def update
    respond_to do |format|
      if @cheat.update(cheat_params)
        format.html { redirect_to @cheat, notice: "Cheat was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @cheat }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @cheat.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /cheats/1 or /cheats/1.json
  def destroy
    @cheat.destroy!

    respond_to do |format|
      format.html { redirect_to cheats_path, notice: "Cheat was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheat
      @cheat = Cheat.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cheat_params
      params.expect(cheat: [ :name, :content, :category ])
    end
end
