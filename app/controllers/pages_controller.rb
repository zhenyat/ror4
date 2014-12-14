class PagesController < ApplicationController
  include ZT

  before_action :set_locale
  before_action :zt_log  if ZT_DEBUG == true  # to monitor which action is used

  def dates
    @time       = Time.now
    @page_title = :dates_page
  end

  def debug
    @groups = Group.all
    @page_title = :debug_page

    my_name     = 'Zhenya'
    zt_log params, @page_title, my_name, @groups
  end

  def home
    @page_title = :home_page
  end

  def form_validation
    @page_title = "#{params[:action]}"
  end

  def init
    @page_title = :init_page
  end

  def multi_form
    @page_title = :multi_form_page
  end

  def net_http
    @page_title = :net_http_page
    if session['HTTP_REFERER'].nil? && session['ip'].nil?
      session['HTTP_REFERER'] = request.env['HTTP_REFERER'].nil? ? nil : request.env['HTTP_REFERER']
      session['ip']           = request.ip.nil?                  ? nil : request.ip
      session['utm_source']   = params['utm_source'].nil?        ? nil : params['utm_source']
      session['utm_medium']   = params['utm_medium'].nil?        ? nil : params['utm_medium']
      session['utm_term']     = params['utm_term'].nil?          ? nil : params['utm_term']
      session['utm_content']  = params['utm_content'].nil?       ? nil : params['utm_content']
      session['utm_campaign'] = params['utm_campaign'].nil?      ? nil : params['utm_campaign']
    end
    zt_log session['HTTP_REFERER'], session['ip'], session['ip'], session['utm_medium'], session['utm_term'], session['utm_content'], session['utm_campaign']
  end

  def sf_sample
    @page_title = :sf_sample_page
    @sections   = Section.all
    @categories = Category.all
    @products   = Product.all
  end

  # Data for the Mailer
  def send_msg
    # Files to be attached
    files = []
    files << 'facebook.jpg'  if params[:my_mail][:jpeg_file]   == 'true'
    files << 'pmt.pdf'       if params[:my_mail][:pdf_file]    == 'true'
    files << 'квитанция.doc' if params[:my_mail][:ms_doc_file] == 'true'

    MyMailer.hello_email(params[:my_mail][:name],
                         params[:my_mail][:email],
                         params[:my_mail][:subject],
                         files).deliver
    flash[:notice] = 'Message sent successfully'
#    render nothing: true
    redirect_to :back
  end

  # Source:  http://sixrevisions.com/css/css-only-tooltips/
  def sexi_tips
    @items = Item.all
  end

  # Update a value via Form on multi_form page and back
  def show_year
    puts "ZT: params= "+params.inspect
    session[:year_selected] = params[:year]
    redirect_to :back
  end

  # Updates a value via Form on multi_form page and back
  def update_year
    session[:year_limit] = params[:year][:limit]
    session[:year_selected] = nil
    redirect_to :back
  end

  def yaml_files
    @page_title = :yaml_files
    @companies = ZT_CONFIG['companies']
#    ZT_CONFIG.each do |key, value|
#      if value.kind_of? Hash
#        value.each do |k,v|
#          puts "ZT: k / v: " + k.to_s + " / " +v.to_s
#        end
#      else
#        puts "ZT: key / value: " + key.to_s + " / " +value.to_s
#      end
#    end
#    y ZT_CONFIG
  end

  def zt_group_cmt
    @page_title = :zt_group_cmt
  end

  def zt_i18n_cmt
    @page_title = :zt_i18n_cmt
  end

  def zt_mailer
    @page_title = :zt_mailer
  end

#  def display hash
#    hash.each do |key, val|
#      # print key etc
#      if val.is_a?(Hash)
#        display val
#      else
#        puts "display = " + val.to_s
#        return val.to_s
#      end
#    end
#  end
end
