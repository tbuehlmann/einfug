require 'pathname'

class Pathname
  BAD_PATHS = [Pathname.new('.'), Pathname.new('..')]
  
  def to_pastie(recursive = false, full = false)
    if self.file?
      return pastie(self, full)
    elsif self.directory?
      pathnames = []
      
      self.children.each do |pathname|
        if recursive
          pathnames << pathname unless BAD_PATHS.include?(pathname)
        elsif pathname.file?
          pathnames << pathname
        end
      end
      
      return pathnames.map do |pathname|
        pathname.to_pastie(recursive, full)
      end.compact.join("\n")
    end
  end
  
  private
  
  def pastie(pathname, full = false)
    if pathname.readable?
      path = full ? pathname.realpath : pathname.basename
      section = "## "
      content = File.read(pathname).sub(/(\r|\n)+\z/, '')
      
      return "#{section}#{path}\n#{content}"
    else
      return nil
    end
  end
end

