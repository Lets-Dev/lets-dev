class Manager::TeamsController < Manager::BaseController
  before_action :set_manager_team, only: [:show, :edit, :update, :destroy]

  # GET /manager/teams
  # GET /manager/teams.json
  def index
    @manager_teams = Team.all
    @own_memberships = current_user.team_user_memberships
  end

  # GET /manager/teams/1
  # GET /manager/teams/1.json
  def show
  end

  # GET /manager/teams/new
  def new
    @manager_team = Team.new
  end

  # GET /manager/teams/1/edit
  def edit
  end

  # POST /manager/teams
  # POST /manager/teams.json
  def create
    @manager_team = Team.new(manager_team_params)

    respond_to do |format|
      if @manager_team.save
        format.html { redirect_to @manager_team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @manager_team }
      else
        format.html { render :new }
        format.json { render json: @manager_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager/teams/1
  # PATCH/PUT /manager/teams/1.json
  def update
    respond_to do |format|
      if @manager_team.update(manager_team_params)
        format.html { redirect_to @manager_team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_team }
      else
        format.html { render :edit }
        format.json { render json: @manager_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager/teams/1
  # DELETE /manager/teams/1.json
  def destroy
    @manager_team.destroy
    respond_to do |format|
      format.html { redirect_to manager_teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_team
      @manager_team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_team_params
      params.fetch(:manager_team, {})
    end
end
