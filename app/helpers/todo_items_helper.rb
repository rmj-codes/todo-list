module TodoItemsHelper
  def status_badge_color(status)
    case status.to_s
    when 'pending'
      'bg-gray-100 text-gray-800'
    when 'in_progress'
      'bg-yellow-100 text-yellow-800'
    when 'completed'
      'bg-green-100 text-green-800'
    else
      'bg-gray-100 text-gray-800'
    end
  end

  def status_card_color(status)
    case status.to_s
    when 'pending'
      'border-gray-200 bg-gray-50'
    when 'in_progress'
      'border-yellow-200 bg-yellow-50'
    when 'completed'
      'border-green-200 bg-green-50'
    else
      'border-gray-200 bg-gray-50'
    end
  end
end
