# WIP
class Duplication
  def grouped_by_class elements = @html.css('*')
    elements.group_by{|e| (e['class']||'').split.sort}
  end

  def all_classes
    @html.css('*').map{|el| (el['class']||'').split}.flatten.compact
  end

  def duplicated_classes? list
    classes = list.map {|el| (el['class']||'').split}.reject(&:empty?).uniq
    classes.count == 1
  end

  # Returns points for duplicated code between node classes
  def duplication
    nodes = @html.css('*')
    nodes.map do |node|
      # siblings
      siblings = node.xpath('following-sibling::*')
      if siblings.any?
        duplicated_classes?(siblings) ? 1 : 0
        #siblings.before(node).map(&:children)
      end
    end.compact.inject(:+)
  end

  def classes_count
    res ={}
    all_classes.uniq.map do |c|
      res[c] = all_classes.count(c)
    end
    Hash[res.sort_by{|key, val| val}.reverse]
  end
end
