#!/usr/bin/env ruby
# Script to check that baseurl is correctly configured
# This script should be run before deploying to GitHub Pages

require 'yaml'

# Expected baseurl for GitHub Pages
EXPECTED_BASEURL = ''
CONFIG_FILE = '_config.yml'

def check_baseurl
  # Check if we're in a CI/production environment
  is_ci = ENV['CI'] == 'true' || ENV['GITHUB_ACTIONS'] == 'true'
  
  # Read the config file
  unless File.exist?(CONFIG_FILE)
    puts "Error: #{CONFIG_FILE} not found!"
    exit 1
  end
  
  config = YAML.load_file(CONFIG_FILE)
  baseurl = config['baseurl'] || ''
  
  error_message = <<~ERROR
    
    ╔════════════════════════════════════════════════════════════════╗
    ║                    BASEURL CONFIGURATION ERROR                  ║
    ╚════════════════════════════════════════════════════════════════╝
    
    The baseurl in #{CONFIG_FILE} is incorrect for GitHub Pages deployment!
    
    Current baseurl:  "#{baseurl}"
    Expected baseurl: "#{EXPECTED_BASEURL}"
    
    To fix this:
    1. Open #{CONFIG_FILE}
    2. Change the baseurl line to:
       baseurl: "#{EXPECTED_BASEURL}"
    3. Commit and push your changes
    
    Note: For local development, you can temporarily set baseurl to ""
    but it MUST be "#{EXPECTED_BASEURL}" for GitHub Pages deployment.
    
    ════════════════════════════════════════════════════════════════
    
  ERROR
  
  # In CI/production, enforce the correct baseurl
  if is_ci
    if baseurl != EXPECTED_BASEURL
      puts error_message
      exit 1
    else
      puts "✓ Baseurl check passed: #{baseurl}"
      exit 0
    end
  else
    # Local development - just warn
    if baseurl != '' && baseurl != EXPECTED_BASEURL
      puts "Warning: baseurl is set to '#{baseurl}'. For local development, consider setting baseurl to '' (empty string)."
      exit 0
    elsif baseurl == EXPECTED_BASEURL
      puts "Warning: baseurl is set to '#{EXPECTED_BASEURL}'. This is correct for GitHub Pages but may cause issues locally."
      puts "Consider setting baseurl to '' (empty string) for local development."
      exit 0
    else
      puts "✓ Baseurl check: Using empty baseurl for local development"
      exit 0
    end
  end
end

# Run the check
check_baseurl

