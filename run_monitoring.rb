require 'rufus-scheduler'

require 'lib/vrops/vrops_to_datadog'

# to-do
# add rufus-scheduler





scheduler = Rufus::Scheduler.new
vrops = Vrops::VropsToDatadog.new
scheduler.every '5m' do

end
