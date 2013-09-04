class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_grp
  before_action :authenticate_user!
   
  # GET /contacts
  # GET /contacts.json
  def index
    if check_member_or_admin_of_group?
    @contacts = @group.contacts
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    check_member_or_admin_of_group?
  end

  # GET /contacts/new
  def new
    if check_member_or_admin_of_group?
    @contact = Contact.new
    @contact.group = @group
  end
  end

  # GET /contacts/1/edit
  def edit
    check_member_or_admin_of_group?
  end

  # POST /contacts
  # POST /contacts.json
  def create
    if check_member_or_admin_of_group?
    @contact = Contact.new(contact_params)
    @contact.group = @group
    @contact.added_by = current_user.id
    respond_to do |format|
      if @contact.save
        format.html { redirect_to group_contact_path(@group, @contact), notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    check_member_or_admin_of_group?
    @contact = @group.contacts.friendly.find(params[:id])
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to group_contact_path(@group, @contact), notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    check_member_or_admin_of_group?
    @contact = @group.contacts.friendly.find(params[:id])
    #@contact = @group.contacts.find_by_slug(params[:id])
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to @group}
      format.json { head :no_content }
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email_id, :facebook_id, :skype_id, :twitter_id)
    end
    def set_grp
      @group = Group.friendly.find(params[:group_id])
    end
    
    def check_member_or_admin_of_group?
      if @group.users.include?(current_user) || @group.creator == current_user
        return true
      else
        redirect_to join_group_path(@group) and return false
    end
  end
    
end