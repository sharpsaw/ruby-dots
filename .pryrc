# vim:ft=ruby
Pry.config.theme = 'vim-detailed'

begin
  require 'awesome_print'
  Pry.print = proc { |output, value| output.puts value.ai }
rescue LoadError
  puts "Consider gem-install awesome_print"
end

# Should be in pry-de
Pry.commands.command 'r' do run 'history --replay -1' end
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'

Pry.commands.command ',l' do run 'edit lib' end

# Should be in pry-docmore.
# Follow pry-doc further, e.g.:
# $ [].push
# C rb_ary_modify
Pry.commands.create_command 'C' do
  def process
    src_dir = ENV['RUBY_SRC_DIR'] || ENV['HOME']+'/pkg'
    unless Dir.exist? src_dir
      puts "Need either $RUBY_SRC_DIR (env var) or ~/pkg/ to exist"
      return
    end
    ruby_dir = src_dir + '/ruby'
    unless Dir.exist? ruby_dir
      puts "Need ruby source checkout."
      ruby_repo = 'https://github.com/ruby/ruby.git'
      puts "Consider: .git clone --depth 1 #{ruby_repo} #{ruby_dir} # takes <1m"
    end
    Dir.chdir ruby_dir do
      unless File.exist? 'tags'
        puts "Building tags file with ctags -R"
        system 'ctags -R'
      end
      # Note: if you know of how to do this on another editor, I'll respect ENV
      system 'vim', '-t', arg_string
    end
  end
end

# TODO: Remember where these came from
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
