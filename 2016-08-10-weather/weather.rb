# Dayton, Ohio is KDAY (Dayton) or KMGY (Miamisburg)
# ruby zeus weather kday

class Weather < Thor
  desc 'weather STATION', 'Prints the weather report from the given airport'
  def weather(station)
    report = Metar::Station.find_by_cccc(station.upcase).report
    art = EmojiArt.new report
    puts "Weather for #{report.station.name.titleize}:"
    puts art.stylized_report
  end
end

class EmojiArt
  attr_reader :report

  def initialize(report)
    @report = report
  end

  def stylized_report
    sky.fetch(report.sky_summary.gsub(' ', '').to_sym, "\u26c5".encode('utf-8'))
  end

  def sky
    {
      brokencloud: "\u26c5".encode('utf-8')
    }
  end

end
