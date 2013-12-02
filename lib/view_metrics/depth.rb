class ViewMetrics::Depth
  def initialize html
    @html = html
  end

  def report
    return unless deepest_element
    "#{deepest_element.tap{|e| e.inner_html=''}}\nis at depth: #{depth}"
  end

  def depth
    return 0 unless deepest_element
    @depth ||= deepest_element.ancestors.count
  end

  def deepest_element
    return @deepest if @deepest
    leaves = @html.xpath("//*[not(child::*)]")
    @deepest = leaves.sort_by {|leaf| leaf.ancestors.count}.last
  end

  def <=> other
    depth <=> other.depth
  end
end
