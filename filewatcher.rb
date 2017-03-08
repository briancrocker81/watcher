require 'filewatcher'
require 'logger'
require 'fileutils'
require_relative 'logger'

# log_file ||= Logger.new File.new('logs/watch_log.log')
# File.open("logs/watch_log.log", "a") {|f| f.write("----- Log started at " + Time.now.strftime("%d/%m/%Y %H:%M") + " -----" + "\n") }


module FolderWatcher

  def watch_folder
    dir = 'src_ism'
    FileWatcher.new(dir +'/*').watch do |filename|
      MyLog.log.info("file: #{filename} has changed")
      copyfile(filename)
    end
  end

  def copyfile(filename)
    unless filename.include? "_aes"
      FileUtils.cp filename, "#{filename}_aes.ism"
      MyLog.log.info("file: #{filename} has copied and renamed to: #{filename}_aes.ism")
    end

  # if copyfile exists do nothing
  # else
  end

  # puts Watcher.instance_methods
end

include FolderWatcher
watch_folder
