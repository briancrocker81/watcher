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
