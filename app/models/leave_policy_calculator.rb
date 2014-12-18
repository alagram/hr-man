class LeavePolicyCalculator
  attr_reader :date_from, :num_of_days

  def initialize(date_from, num_of_days)
    @date_from = date_from
    @num_of_days = num_of_days
  end

  def days_between_dates
    # returns number of days between date range
    (Date.parse(date_to) - Date.parse(date_from)).to_i
  end

  def find_end_date
    (Date.parse(date_from) + num_of_days.days)
  end

  # def holiday_count
  #   # returns count of holidays within date range
  #   Date.parse(date_from).step(find_end_date).select { |d| d if Holiday.where(hol_date: d).first }.count
  # end

  # def weekend_days
  #   # returns number of weekend days between date range
  #   Date.parse(date_from).step(find_end_date).select { |d| d.saturday? || d.sunday? }
  # end

  # def actual_leave_days_count
  #   gross_total_days = Date.parse(date_from).step(find_end_date).count
  #   weekend_count = num_weekend_days
  #   gross_total_days - weekend_count
  # end

  def get_end_date(check_holiday: nil, check_weekend: nil)
    i = 0
    num_days = num_of_days.to_i
    end_date = Date.parse(date_from)
    loop do
      i += 1
      end_date += 1.days

      if check_holiday == true
        if get_holidays.include?(end_date)
          end_date += 1.days
        end
      end

      if check_weekend == true
        if end_date.saturday?
          end_date += 2.days
        end
      end

      break if i > num_days
    end
    end_date
  end

  def get_holidays
    @holidays ||= Holiday.pluck(:hol_date)
  end
end
