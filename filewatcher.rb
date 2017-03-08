require 'filewatcher'
require 'logger'

# log_file ||= Logger.new File.new('logs/watch_log.log')
# File.open("logs/watch_log.log", "a") {|f| f.write("----- Log started at " + Time.now.strftime("%d/%m/%Y %H:%M") + " -----" + "\n") }

class MyLog
  def self.log
    if @logger.nil?
      @logger = Logger.new "logs/watch_log.log"
      @logger.debug "----- Log started at " + Time.now.strftime("%d/%m/%Y %H:%M") + " -----"
      @logger.level = Logger::DEBUG
      @logger.datetime_format = '%Y-%m-%d %H:%M:%S '
    end
    @logger
  end
end


dir = Dir.pwd

FileWatcher.new(dir +'/*').watch do |filename|
  # puts "file #{filename} changed"
  MyLog.log.info("file: #{filename} has changed")
end
