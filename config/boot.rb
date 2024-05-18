<<<<<<< HEAD
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
=======
ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)
>>>>>>> origin/feature/tokens-page

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
