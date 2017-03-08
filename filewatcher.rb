require 'filewatcher'
require 'logger'

dir = Dir.pwd

FileWatcher.new(dir).watch do |filename|
  puts "file #{filename} changed"
end
