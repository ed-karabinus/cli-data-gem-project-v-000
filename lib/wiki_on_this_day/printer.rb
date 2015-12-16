# require 'catpix'

class WikiOnThisDay::Printer
  
  attr_reader :html_doc, :events_hash

  def initialize(html_doc, events_hash)
    @html_doc = html_doc
    @events_hash = events_hash
  end

  # def on_this_day_image
  #   open('https:' + self.html_doc.css('div#mp-otd-img img').attribute('src').value) { |file|
  #     image_of_the_day = Tempfile.new("image_of_the_day")
  #     image_of_the_day << file.read
  #     image_of_the_day.rewind
  #     Catpix::print_image image_of_the_day.path,
  #       :limit_x => 0.5,
  #       :limit_y => 0,
  #       :center_x => true,
  #       :center_y => false,
  #       :bg => "white",
  #       :bg_fill => true,
  #       :resolution => "high"
  #     image_of_the_day.close
  #   }
  # end

  def print
    @events_hash.each do |key, value|
      puts value[:year]
      abstract = value [:text]
      if /\W\(pictured\)/.match(abstract)
        puts abstract.gsub(/\W\(pictured\)/, '')
      else
        puts abstract
      end
    end
  end

end