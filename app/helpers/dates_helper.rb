################################################################################
#  Methods to output date and time
#  see locales: defaults
#
#  19.12.2013  zt_datetime added
#  31.12.2013  Last update: optimized
#  03.04.2014  zt_ts (Timestamp method)
################################################################################
module DatesHelper

  # Dates processing
  def zt_date input_date, flag="default"
    if flag == "long"
      l input_date, format: :long_date
    elsif flag == "short"
      l input_date, format: :short_date
    else
      l input_date, format: :short_date
    end
  end

  # DateTimes processing
  def zt_datetime input_datetime, flag="default"
    if flag == "full"
      l input_datetime, format: :full
    elsif flag == "long"
      l input_datetime, format: :long
    elsif flag == "short"
      l input_datetime, format: :short
    else
      l input_datetime, format: :default
    end
  end

  # Two dates interval
  def zt_dates_interval(date_first, date_last)
    # Convert arguments to Time class
    date_first = date_first.to_time
    date_last  = date_last.to_time

    # Swap dates if required
    date_first, date_last = date_last, date_first  if date_first > date_last

    if date_first.year == date_last.year
      if date_first.month == date_last.month
        "#{l date_first, format: :day}       - #{l date_last, format: :long_date}"
      else
        "#{l date_first, format: :day_month} - #{l date_last, format: :long_date}"
      end
    else
      "#{l date_first,   format: :long_date} - #{l date_last, format: :long_date}"
    end
  end

  # Times processing
  def zt_time input_time, flag="default"
    if flag == "long"
      l input_time, format: :long_time
    elsif flag == "short"
      l input_time, format: :short_time
    else
      l input_time, format: :long_time
    end
  end

  # Timestamp (for debugging)
  def zt_ts
    Time.now.strftime "[%Y-%m-%d %H:%M:%S]"
  end
end
