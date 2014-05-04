################################################################################
#   zt_settings.rb:  Sets Constants and other Parameters to be applied fro run
#
#                    Called by: zt_load_config.rb
#
#   05.04.2014  1.0.0
################################################################################

# Constants
ZT_CONSTANT_DATE  = '2013-10-01'.to_date        # see in: yaml_files.html.erb
ZT_CONTSTANT_MAIL = ZT_CONFIG['mail']['bcc']    # see in: yaml_files.html.erb

ZT_DEBUG    = ZT_CONFIG['debug']['status']      # see in: pages_controller.rb

if ZT_CONFIG['debug']['path'].nil? || ZT_CONFIG['debug']['path'].empty?
  ZT_LOG_FILE = nil
else
  ZT_LOG_FILE = "#{Rails.root}/#{ZT_CONFIG['debug']['path']}"
end

# Debug Logging: Create a log-file
if ZT_DEBUG == true && !ZT_LOG_FILE.nil?
  File.open(ZT_LOG_FILE, 'w') { |file| file.puts "Starting debug log..."}
end


