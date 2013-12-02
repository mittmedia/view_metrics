class ViewMetrics::Reporter
  def self.from_collection paths
    Dir[*paths].map do |name|
      new(name)
    end
  end

  def initialize file
    @file = file
    @content = File.read(file)
  end

  def html
    @html ||= Nokogiri::HTML.parse(content)
  end

  def content
    @content.gsub(/\<\%.+?\%\>/m, "")
  end

  def depth
    @depth ||= Depth.new(html)
  end

  def report
    puts "===== #{@file} ====="
    puts "Rows: #{rows}"
    puts ""
    puts depth.report
    puts ""
  end

  def rows
    @rows ||= @content.scan(/\n/).count+1
  end
end
