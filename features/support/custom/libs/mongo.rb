require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log") # Cria um log de informações na pasta informada

class MongoDb
  def remove_spot(company, user_id)
    spots.delete_many({ company: company, user: user_id.to_mongo_id })
  end

  def remove_my_spots(user_id)
    spots.delete_many({ user: user_id.to_mongo_id })
  end

  private

  # retorna a colletion
  def spots
    return client[:spots]
  end

  def client
    str_conn = "mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=false"
    return Mongo::Client.new(str_conn)
  end
end
