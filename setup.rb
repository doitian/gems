#!/usr/bin/env ruby
require 'yaml'

yaml = File.expand_path('../gems.yml', __FILE__)
gems = YAML.load_file(yaml)

gems.each do |gem, versions|
  versions = [versions] unless versions.is_a?(Array)
  versions.each do |version|
    version_arg = ''
    if version != 'latest'
      version_arg = "--version '#{version}'"
    end
    puts "gem install #{version_arg} --no-ri --no-rdoc #{gem}"
    system "gem install #{version_arg} --no-ri --no-rdoc #{gem}"
  end
end

