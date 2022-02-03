#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'

services_path = './Services/'

servers = YAML.load_file('servers.yml')['servers']
services = YAML.load_file('services.yml')['services']

servers.each do |server, data|
  data['services'].each do |service_name, service_data|
    next unless services.key? service_data['type']

    puts "Running #{service_name} for #{server}..."

    # Service executable full path
    service = "#{services_path}#{services[service_data['type']]['path']}"

    # Run service
    if service_data['type'].eql?('Basic')
      puts `#{service} #{server} #{service_data['path']} #{service_name}`
    else
      `#{service} #{server} #{service_data['path']} `
    end
  end
end
