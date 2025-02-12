require 'net-ping'

# settings = YAML.load_file(File.join(File.expand_path('./.'), 'config.yml'))
settings = YAML.load_file(File.join('/smashing', 'config.yaml'))
tirs_settings = settings['ping']

settings['ping'].each do |_id, host|
    SCHEDULER.every '10s', :first_in => 0  do
        status = up?(host['ip']) ? "green" : "red"
        send_event("ping_#{_id}", {status: status, host: host['ip'], hostname: host['name']})
    end
end