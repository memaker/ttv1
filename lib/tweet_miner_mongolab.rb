require 'mongo'

class TweetMiner
  attr_writer :db_connector
  attr_reader :options

  def initialize(options)
    @options = options
  end

  def db
    @db ||= connect_to_db
  end

  def statuses
    # @statuses ||= db['statuses']
    @statuses ||= db[options['collection']]
  end
  
  def insert_status(status)
    statuses.insert status
  end

  private
  def connect_to_db
    @connection ||= Mongo::Connection.from_uri(options['mongo_uri'])
    @db_connector = @connection.db(options['db_name'])
  end
end
