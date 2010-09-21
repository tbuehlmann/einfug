require 'pathname'

module Einfug
  VERSION = '0.0.1'.freeze
end

class Pathname
  BAD_PATHS = [Pathname.new('.'), Pathname.new('..')]
  EXTENSIONS = {'.rb' => 'ruby', '.java' => 'java'} # TODO

  def to_pastie(recursive = false, full = false, auto_extend = false)
    if self.file?
      return pastie(self, full, auto_extend)
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
        pathname.to_pastie(recursive, full, auto_extend)
      end.compact.join("\n")
    end
  end

  private

  def pastie(pathname, full = false, auto_extend = false)
    if pathname.readable?
      path = full ? pathname.realpath : pathname.basename

      extension = if auto_extend && extname = EXTENSIONS[pathname.extname]
        " [#{extname}]"
      else
        ''
      end

      content = begin
        File.read(pathname).sub(/(\r|\n)+\z/, '')
      rescue ArgumentError
        File.read(pathname, :encoding => "BINARY").sub(/(\r|\n)+\z/, '')
      end

      return "## #{path}#{extension}\n#{content}"
    end
  end
end

