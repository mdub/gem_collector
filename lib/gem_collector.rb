require 'rubygems'

module GemCollector

  extend self

  # Shadow Kernel#gem, extending it to auto-install missing gems
  def gem(name, *version_requirements)
    dependency = Gem::Dependency.new(name, *version_requirements)
    if Gem.source_index.search(dependency).empty?
      puts "Installing #{dependency}"
      installer.install(dependency)
    else
      puts "#{dependency} is already installed"
    end
  end

  # Evaluate a block (or String) in a context that auto-installs missing gems
  def eval(*args)
    instance_eval(*args)
  end

  # Load a Ruby file, auto-installing missing gems
  def load(file)
    eval(File.read(file), file)
  end

  private

  def installer
    @installer ||= create_installer
  end

  def create_installer
    begin
      require 'rubygems/dependency_installer'
    rescue LoadError
      raise %{ERROR: RubyGems installation is too old; please run "sudo gem update --system"}
    end
    Gem::DependencyInstaller.new
  end

end
