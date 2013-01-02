# vim:ft=ruby
if RUBY_VERSION[/^1.8/]
  def Readline.point; end # Fix for pry-editline incompatibility
  def Readline.set_screen_size *args; end # Fix for auto_resize!
  Pry.plugins['docmore'].disable!
end

if Pry.respond_to? :auto_resize!
  Pry.auto_resize!
else
  warn 'Non-new pry: patching WINCH manually.'
  trap :WINCH do
    size = `stty size`.split(/\s+/).map &:to_i
    Readline.set_screen_size *size
    Readline.refresh_line
  end
end

def watch dirs = %w(lib app test spec)
  subdirs = dirs.map do |e|
    Dir[e+'/**/'].find_all{|d| Dir.exists? d}
  end.flatten
  unless subdirs
    warn "Not watching; #{dirs.join ' '} missing."
    return
  end
  require 'listen'
  Thread.new do
    Listen.to *subdirs, filter: /\.rb$/ do |change, add, remove|
      [change, add].flatten.uniq.each do |rb|
        begin
          simplified_rb = rb.sub /^#{Regexp.escape(Dir.pwd)}\//, ''
          puts "\n['\e[36;1m#{simplified_rb}\e[0m']"
          if block_given?
            yield rb if block_given?
          else
            load rb
          end
        rescue => e
          warn "\e[31m#{e}\e[0m"
        end
      end
    end
  end
rescue => e
  warn e
end

Pry.config.theme = 'vim-detailed'
#Pry.config.exception_handler = proc { |_, ex, _pry_| _pry_.run_command "enter-exception" } 

#begin; require 'development'; rescue LoadError; puts "No `development` gem!" end

# TODO work with this
# http://www.igvita.com/2008/12/11/ruby-ast-for-fun-and-profit/
def d c
  require 'parsetree'
  ParseTree.translate c
end
def s c
  require 'ruby4ruby'
  SexpProcessor.new.process d(c)
end

def hammit haml
  require 'haml'
  Haml::Engine.new(haml).render
end

# So you don't type a = [1,2,3] or h = { a: 1, b: 2 } so much.
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end
class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end
