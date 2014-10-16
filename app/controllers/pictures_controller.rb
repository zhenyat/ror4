class PicturesController < ApplicationController  
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_filter :set_locale     #ZT

  # POST /pictures
  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to picture_url(id: @picture), notice: t('activerecord.successful.messages.created', model: @picture.class.model_name.human)
    else
      render action: 'new'
    end
  end

  # DELETE /pictures/1
  def destroy
    @picture.destroy
    redirect_to pictures_url
  end

  # GET /pictures/1/edit
  def edit
  end

  # GET /pictures
  def index
    @pictures   = Picture.all
    @page_title = :pictures
  end

  # GET /pictures/new
  def new
    @picture    = Picture.new
    @page_title = :new_picture
  end

  # GET /pictures/1
  def show
    @image = read_image
  end

  # PATCH/PUT /pictures/1
  def update
    if @picture.update(picture_params)
      redirect_to picture_url(id: @picture), notice: t('activerecord.successful.messages.updated', model: @picture.class.model_name.human)
    else
      render action: 'edit'
    end
  end

  # Upload selected picture and populate it to the DB
  def upload
    uploaded_io = params[:picture][:picture_file]
    unless uploaded_io.nil?
      original_filename = uploaded_io.original_filename
      File.open("#{Rails.root}/#{ZT_CONFIG['pictures']['path']}/#{original_filename}", 'wb').write(uploaded_io.read)
      Picture.create(filename: original_filename, title: params[:picture][:title])
      
      path = "#{Rails.root}/#{ZT_CONFIG['pictures']['path']}"
      file = "#{path}/#{original_filename}"
      new_file = "#{path}/thumb_#{original_filename}"
      cmd = "convert #{file} -resize '100' #{new_file}"
      system(cmd)
    else
      render new_picture_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  private

  def read_image
    Magick::Image::read("#{ZT_CONFIG['pictures']['path']}/#{@picture.filename}").first
  end


  def set_picture
    @picture = Picture.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def picture_params
    params.require(:picture).permit(:filename, :title)
  end
end
