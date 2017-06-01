module ApplicationHelper
  def nice_date(fecha)
    return nil unless fecha
    fecha.strftime('%A, %d de %B de %Y')
  end

  def nice_date_time(fecha)
    return nil unless fecha
    fecha.strftime('%A, %d de %B de %Y - %I:%M %p')
  end
end
