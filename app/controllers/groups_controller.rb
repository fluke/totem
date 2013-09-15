class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :join, :join_complete, :leave, :members, :remove_member]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :join, :join_complete, :leave, :members, :remove_member, :mygroups]
  before_action :check_group_admin_controller, only: [:edit, :update, :destroy, :members, :remove_member]

  # GET /groups
  # GET /groups.json
  def index
    if params[:search]
    @groups = Group.search((params[:search]).to_s.downcase).paginate(:per_page => 10, :page => params[:page])
   end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    if @group.users.include?(current_user) || @group.creator == current_user
      @contacts = @group.contacts.search((params[:search]).to_s.downcase)
    else
    redirect_to join_group_path  
    end
  end
  
  def mygroups
    @belong_groups = current_user.groups.uniq
    @groups = current_user.owned_groups
    #.paginate(:per_page => 10, :page => params[:page])
  end
  
  def join
    if (@group.users.include?(current_user)) || (@group.creator == current_user)
       flash[:notice] = "You are already a member of this group."
       redirect_to groups_url
    end
  end
  
  def members
     @members = @group.users
  end
  
  def remove_member
    usr = User.find(params[:member_id])
    if @group.users.include?(usr)
      @group.users.delete(usr)
       flash[:notice] = "Successfuly removed user from group."
       redirect_to group_members_path
     else
       flash[:notice] = "Not a member of this group."
       redirect_to groups_url
     end
  end
  
  def leave
    if @group.creator == current_user
      flash[:notice] = "You are the owner of this group. To remove this group, delete it."
      redirect_to groups_url and return
    end
      if @group.users.include?(current_user)
        @group.users.delete(current_user)
         flash[:notice] = "Successfuly left group."
         redirect_to groups_url
       else
         flash[:notice] = "Not a member of this group."
         redirect_to groups_url
       end
  end
  
  
def join_complete
if current_user
if @group.password == params[:pass]
  @group.users << current_user
  else
    flash[:notice] = "Wrong password."
    redirect_to groups_url and return
  end
else
  flash[:notice] = "Log in please."
  redirect_to groups_url and return
end
redirect_to groups_url and return
end
  
  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    if current_user
      @group.user_id = current_user.id
    end
    
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :password, :search)
    end
    
    def check_group_admin_controller
      
      unless check_group_admin?
       flash[:notice] = "You are not the admin of this group."
       redirect_to groups_path
     end
    end
    
end
