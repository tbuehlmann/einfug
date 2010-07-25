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
      content = begin
        File.read(pathname).sub(/(\r|\n)+\z/, '')
      rescue ArgumentError
        File.read(pathname, :encoding => "BINARY").sub(/(\r|\n)+\z/, '')
      end
      
      return "#{section}#{path}\n#{content}"
    end
  end
end

