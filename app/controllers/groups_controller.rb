################################################################################
#   Standard scaffold Controller is modified to meet I18n requirements
#
#   15.12.2013  page titles
#   03.01.2014  Last update (simplify code: no respond_to)
################################################################################
class GroupsController < ApplicationController

  before_filter :set_locale     #ZT
  before_action :set_group,  only: [:show, :edit, :update, :destroy]

# respond_to :html, :xml, :json   # ZT: for future usage

  # GET /groups
  def index
    @groups      = Group.all
    @page_title  = :groups
  end

  # GET /groups/1
  def show
  end

  # GET /groups/new
  def new
    @group      = Group.new
    @page_title = :new_group
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_url(id: @group), notice: t('activerecord.successful.messages.created', model: @group.class.model_name.human)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      redirect_to group_url(id: @group), notice: t('activerecord.successful.messages.updated', model: @group.class.model_name.human)
    else
      render action: 'edit'
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_url
  end

  # Use callbacks to share common setup or constraints between actions.
  private

    ############################################################################
    # ZT: this method is good to be used when I18n is applied (see page zt_i18n.html):
    #     Use it to replace code: @group = Group.find(params[:id])
    ############################################################################
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
#     params.require(:group).permit(:name, :title)  # ZT
      params.require(:group).permit(:title)         # ZT: only title is white-listed for mass assignment
    end
end
