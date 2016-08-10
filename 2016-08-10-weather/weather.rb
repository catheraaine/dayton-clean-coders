class Weather < Thor
  desc 'weather STATION', 'Prints the weather report from the given airport'
  def weather(station)
    puts Metar::Station.find_by_cccc(station.upcase).report.to_s
  end
end
