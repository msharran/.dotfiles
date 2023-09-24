#!/usr/bin/env ruby
# frozen_string_literal: true

require 'colorize'

# This class represents a pkg
class Pkg
  attr_accessor :name, :cmd, :post_install
end

# This class is responsible for parsing the Pkgfile
class Installer
  attr_reader :pkgs

  def initialize
    # Initialize the list of pkgs
    # as an empty array.
    @pkgs = []
  end

  def read_installfile
    # Read the contents of the Installfile as a string.
    contents = File.read('Installfile')

    # Evaluate the Ruby string within the context
    # of the Dsl instance. That is, execute whatever
    # code found in the Gemfile using the state of
    # the current Dsl object.
    instance_eval(contents)
  end

  private

  # install directive definition
  # Installs pkg using brew
  # If cmd is provided, it will be executed
  # instead of brew install.
  def install(pkg_name, options = {})
    pkg = Pkg.new
    pkg.name = pkg_name
    pkg.cmd = options.fetch(:cmd, nil)
    pkg.post_install = options.fetch(:post_install, nil)
    @pkgs << pkg
  end
end

installer = Installer.new
installer.read_installfile

installer.pkgs.each_with_index do |pkg, i|
  msg = "Installing #{pkg.name} (#{i + 1}/#{installer.pkgs.length})...".colorize(mode: :bold)
  puts "🍺 #{msg}"

  cmd = if pkg.cmd.nil? || pkg.cmd.empty?
          "brew install #{pkg.name}"
        else
          pkg.cmd
        end

  puts "Command: #{cmd.light_blue.underline}"
  system(cmd) or raise "Something went wrong while executing the command #{cmd}"
  puts "✅ #{pkg.name} installed"

  next if pkg.post_install.nil?

  msg = "Running post install script #{pkg.post_install}...".colorize(mode: :bold)
  puts "🍺 #{msg}"
  puts "Command: #{pkg.post_install.light_blue.underline}"
  system(pkg.post_install) or raise "Something went wrong while running #{pkg.post_install}"
  puts '✅ Post install script completed'
end
