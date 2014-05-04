################################################################################
# zt_load_config.rb:
#   (1) Loads default config parameters from YAML file at Initialization Phase
#   (2) Updates parameters with values set for the Application Run
#
#   Source: http://railscasts.com/episodes/85-yaml-configuration-file
#
#   10.03.2014  ZT
#   24.03.2014  Constants loading added
################################################################################

# Gets default configuration parameters
filename = 'config/zt_config.yml'
if File.exists? "#{Rails.root}/#{filename}"
  ZT_CONFIG = YAML.load_file("#{Rails.root}/#{filename}")[Rails.env]

  # Updates default configuration parameters for the Application Run
  filename = 'config/zt_run_config.yml'
  if File.exists? "#{Rails.root}/#{filename}"
    zt_run_config = YAML.load_file("#{Rails.root}/#{filename}")
    ZT_CONFIG.deep_merge! zt_run_config if zt_run_config.present?  # File contains values
  end
end

# Sets Constants and Parameters for the Application run (see result in View: yaml_files.html.erb
filename = 'config/zt_settings.rb'
if File.exists? "#{Rails.root}/#{filename}"
  eval File.read("#{Rails.root}/#{filename}")
end
