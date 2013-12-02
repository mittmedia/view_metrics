require "view_metrics/version"
require 'nokogiri'
require 'view_metrics/depth'
require 'view_metrics/reporter'

class ViewMetrics
  def initialize *paths
    @reporters = Reporter.from_collection(paths)
    puts @reporters
  end

  def report
    @reporters.sort_by(&:depth).each do |r|
      r.report
    end
  end
end

ViewMetrics.new('app/components/blocks/**/*.html.erb', 'app/views/**/*.html.erb').report
