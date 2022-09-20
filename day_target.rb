require 'csv'
require 'date'

contents = CSV.open(
  'event_attendees.csv',
  headers: true
)
ordered_days = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
days = []
day_count = Hash.new(0)
contents.each do |row|
  day = row[1]
  weekday = Date.strptime(day, "%m/%d/%Y %k:%M")
  days << weekday.wday
end

days.each do |d|
  day_count[d] += 1
end

sorted_days = day_count.sort_by { |k, v| v }.reverse.to_h
sorted_days.each { |k, v| puts "Day: #{ordered_days[k]} --- people registered: #{v}."}

