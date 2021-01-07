#!/usr/bin/env ruby

require "bundler/setup"
require "michigan_beer"
require_relative "../lib/michigan_beer"

# binding.pry
MichiganBeer::CLI.new.call
