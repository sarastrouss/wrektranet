# == Schema Information
#
# Table name: calendars
#
#  id               :integer          not null, primary key
#  url              :string(255)
#  name             :string(255)
#  default_location :string(255)
#  weeks_to_show    :integer          default(1)
#  created_at       :datetime
#  updated_at       :datetime
#

class Calendar < ActiveRecord::Base
  require 'open-uri'

  validates :url, url: true
  validates :name, presence: true

  def parse(options = {})
    events = nil
    calendar = nil

    open(url) do |cal|
      calendar = Icalendar.parse(cal).first
    end

    if options[:min_date] and options[:max_date]
      events = calendar.
        events.select! { |event|
          event.dtstart >= options[:min_date] and
            event.dtstart <= options[:max_date]
        }
    elsif options[:min_date]
      events = calendar.
        events.select! { |event|
          event.dtstart >= options[:min_date]
        }
    elsif options[:max_date]
      events = calendar.
        events.select! { |event|
          event.dtstart <= options[:max_date]
        }
    else
      events = calendar.events
    end

    return events.sort_by { |event| event.dtstart }
  end
end
