require 'filewatcher'
require 'logger'
require 'fileutils'
require 'nokogiri'
require_relative 'logger'

# log_file ||= Logger.new File.new('logs/watch_log.log')
File.open("logs/watch_log.log", "a") {|f| f.write("----- Log started at " + Time.now.strftime("%d/%m/%Y %H:%M") + " -----" + "\n") }

module Watcher

  def watch_folder
    dir = 'src_ism'
    # ToDo add check for watching only non aes_files here
    FileWatcher.new(dir +'/*').watch do |filename|

      MyLog.log.info("file: #{filename} has changed")
      copy_file(filename)

    end
  end

  def copy_file(filename)
    unless filename.include?("_aes") #ignore any aes file changes
      aes_file = filename + "_aes"
      if File.file?(aes_file)
        # if aes file already exists do not copy, just update
        update_file(aes_file)
        MyLog.log.info("file: #{aes_file} has been updated")
      else
        # else (copy and update)
        # strip .ism from filename
        file = filename[/[^.]+/] #remove characters after fullstop
        aes_file = FileUtils.cp filename, "#{file}_aes.ism"
        MyLog.log.info("file: #{filename} has copied and renamed to: #{filename}_aes.ism")
        update_file(aes_file)
      end
    end
    # ToDo Confirm functionality required, Alan, on how the tool will process these requests.
  end

  def update_file(aes_file)
    # open with nokgiri
    # add aes keys, using
    # save file
  end

  def get_keys(aes_file)
    # Call needs to be made to use live keys from API -  this should probably be done in a separate module to be added in

    # Dummy placeholder method
    MyLog.log.info("Rotate key")
    key = (0..10).map{rand(0..10)}
  end

  # puts Watcher.instance_methods
end

include Watcher
watch_folder
