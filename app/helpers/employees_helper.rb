module EmployeesHelper

  def is_holiday(date)
    return (date.sunday?                ||
    (date.month == 1 && date.day == 1)  ||  #January  1st
    (date.month == 4 && date.day == 14) ||  #April    14th
    (date.month == 5 && date.day == 1)  ||  #May      1st
    (date.month == 9 && date.day == 15) ||  #Sept     15th
    (date.month == 10 && (date.day == 3 || date.day == 12 || date.day == 21)) ||
    (date.month == 12 && date.day == 25))   #Dec      25th
  end

end
