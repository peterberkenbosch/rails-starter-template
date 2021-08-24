require "capybara/rspec"

Capybara.server = :puma, {Silent: true}

Capybara.register_driver :chrome_headless do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--no-sandbox")
  options.add_argument("--headless")
  options.add_argument("--disable-gpu")
  options.add_argument("--window-size=2800,2800")

  if ENV["CHROME_URL"]
    Capybara::Selenium::Driver.new(app,
      browser: :remote,
      url: ENV["CHROME_URL"],
      capabilities: options)
  else
    require "webdrivers"
    Capybara::Selenium::Driver.new(app,
      browser: :chrome,
      capabilities: options)
  end
end

RSpec.configure do |config|
  config.before(:each, type: :system) {
    driven_by :chrome_headless

    capybara_host = IPSocket.getaddress(Socket.gethostname)

    Capybara.app_host = "http://#{capybara_host}:3000"
    Capybara.server_host = capybara_host
    Capybara.server_port = 3000
  }
end
