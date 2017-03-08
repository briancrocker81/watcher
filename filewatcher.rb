require 'filewatcher'
require 'logger'
require 'fileutils'
require_relative 'logger'

# log_file ||= Logger.new File.new('logs/watch_log.log')
# File.open("logs/watch_log.log", "a") {|f| f.write("----- Log started at " + Time.now.strftime("%d/%m/%Y %H:%M") + " -----" + "\n") }



dir = Dir.pwd

FileWatcher.new(dir +'/*').watch do |filename|
  MyLog.log.info("file: #{filename} has changed")
  # copyfile(filename)
end
