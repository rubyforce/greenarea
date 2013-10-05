class ProjectDecorator < Draper::Decorator
  delegate_all

  include ActionView::Helpers::NumberHelper

  def address?
    address.strip.present?
  end

  def days_to_close
    return 0 unless finish_investment.present?
    ((finish_investment - DateTime.now).to_f / 60.to_f / 60.to_f / 24.to_f).round
  end

  def updated_at
    object.updated_at.strftime("%A, %B %e")
  end

  def investment_type
    object.investment_type.camelcase
  end

  def percent
    object.percent.to_f
  end

  def view_percent
    number_to_percentage(percent, :precision => 0)
  end

  def view_remaining_percent
    number_to_percentage(100 - percent, :precision => 0)
  end

  def view_price
    if percent >= 100
      "goal reached"
    else
      "$#{number_to_human(price, :precision => 2).to_s.gsub(/ /, '')}".html_safe
    end
  end

  def view_raise
    unless raised.to_i.zero?
      "$#{number_to_human(raised, :precision => 2).to_s.gsub(/ /, '')}".html_safe
    end
  end
end

