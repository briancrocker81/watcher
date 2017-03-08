require 'filewatcher'

puts Dir.pwd

FileWatcher.new('./').watch do |filename|
  puts "file #{filename} changed"
end
