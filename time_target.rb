# frozen_string_literal: true

require 'csv'
require 'time'

contents = CSV.open(
  'event_attendees.csv',
  headers: true
)
hours = []
hour_count = Hash.new(0)
contents.each do |row|
  time = row[1]
  time = Time.strptime(time, "%m/%d/%Y %k:%M")
  hours << time.to_s[11, 2]
  end

hours.each do |h|
  hour_count[h] += 1
end
sorted_hours = hour_count.sort_by { |k, v| v }.reverse.to_h
sorted_hours.each {|k, v| puts "Hour: #{k}, People registered: #{v}"}
