set :output, "#{path}/log/cron.log"

every 1.day, :at => '8:00 pm' do
  rake "search_suggestions:index"
end
