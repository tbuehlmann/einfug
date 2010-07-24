require 'pathname'

class Pathname
  def to_pastie(recursive = false, full = false)
    if self.file?
      return pastie(self, full)
    elsif self.directory?
      pathnames = []
      bad_paths = [Pathname.new('.'), Pathname.new('..')]
      
      self.children.each do |pathname|
        if recursive
          pathnames << pathname unless bad_paths.include?(pathname)
        elsif pathname.file?
          pathnames << pathname
        end
      end
      
      return pathnames.map { |pathname| pathname.to_pastie(recursive, full) }.join("\n")
    end
  end
  
  private
  
  def pastie(file, full = false)
    path = full ? file.realpath : file.basename
    section = "## "
    content = File.read(file).sub(/(\r|\n)+\z/, '')
    
    return "#{section}#{path}\n#{content}"
  end
end

