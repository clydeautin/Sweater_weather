class MapQuestService

  def self.conn
    Faraday.new(url: "https://www.mapquestapi.com") do |faraday|
    end
  end

  def self.get_directions(from, to)
    api_key = Rails.application.credentials.map_quest[:key]
    encoded_from = URI.encode_www_form_component(from)
    encoded_to = URI.encode_www_form_component(to)

    response = conn.get("/directions/v2/route?key=#{api_key}&from=#{encoded_from}&to=#{encoded_to}")

    data = JSON.parse(response.body, symbolize_names: true)
    if response.success? && data[:info][:statuscode] == 0
      data[:route]
    else
      raise "Routing is impossible: #{data[:info][:messages].join(', ')}"
    end
  end
end