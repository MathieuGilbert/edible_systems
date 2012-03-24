# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
EdibleSystems::Application.initialize!

# key for negative captcha form
NEGATIVE_CAPTCHA_SECRET = '8bdb18772200189130adcfb6a52fb18bb4d8de6515224a928fd05614ed3d5ee90e0e9654e07b3ced3770395e6a91d1cefc6cbd935002558bea3e0ba7d1a37b03'
