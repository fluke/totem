class EngagementsController < ApplicationController
  before_action :set_engagement, only: [:destroy]
   before_action :authenticate_user!
  # GET /engagements
  # GET /engagements.json
  # GET /engagements/new
  # POST /engagements
  # POST /engagements.json
  def create
    check_member_or_admin_of_group?
    @engagement = Engagement.new(engagement_params)
    @engagement.contact_id = Contact.friendly.find(params[:contact_id]).id
   #@engagement.contact_id = params[:contactid]
    respond_to do |format|
      if @engagement.save
        format.html { redirect_to request.referer, notice: 'Engagement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @engagement }
      else
        format.html { render action: 'new' }
        format.json { render json: @engagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engagements/1
  # PATCH/PUT /engagements/1.json

  # DELETE /engagements/1
  # DELETE /engagements/1.json
  def destroy
    check_member_or_admin_of_group?
    @engagement.destroy
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engagement
      @engagement = Engagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engagement_params
      params.require(:engagement).permit(:description, :engage_time, :engage_date)
    end
    
      def check_member_or_admin_of_group?
        if (params[:group_id])
          @group = Group.friendly.find(params[:group_id])
        if @group.users.include?(current_user) || @group.creator == current_user
          return true
        else
          redirect_to join_group_path(@group) and return false
      end
    end
    end
end
