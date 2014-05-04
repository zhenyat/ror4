module PicturesHelper
  ##############################################################################
  #   Calculates width & height of a thumbnail image proportionally to the
  #   to the given size of either Width or Height
  #
  #   04.01.2014  Created
  #   10.03.2014  Last update (ZT_CONFIG applied)
  ##############################################################################
  def thumb_size filename
    size = ZT_CONFIG['pictures']['size']

    image  = Magick::Image::read("#{ZT_CONFIG['pictures']['path']}/#{filename}").first
    factor = size.first !=0.0 ? size.first / image.columns : size.last / image.rows

    [(image.columns*factor).to_i, (image.rows*factor).to_i]
  end
end
