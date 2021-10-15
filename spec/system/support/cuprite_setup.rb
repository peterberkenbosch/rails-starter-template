# First, load Cuprite Capybara integration
require "capybara/cuprite"

REMOTE_BROWSER_URL = ENV["REMOTE_BROWSER_URL"]
REMOTE_BROWSER_HOST, REMOTE_BROWSER_PORT =
  if REMOTE_BROWSER_URL
    URI.parse(REMOTE_BROWSER_URL).yield_self do |uri|
      [uri.host, uri.port]
    end
  end

# Check whether the remote chrome is running.
remote_browser =
  begin
    if REMOTE_BROWSER_URL.nil?
      false
    else
      Socket.tcp(REMOTE_BROWSER_HOST, REMOTE_BROWSER_PORT, connect_timeout: 1).close
      true
    end
  rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, SocketError
    false
  end

remote_options = remote_browser ? { url: REMOTE_BROWSER_URL } : {}

# Then, we need to register our driver to be able to use it later
# with #driven_by method.
Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    **{
      window_size: [1200, 800],
      # See additional options for Dockerized environment in the respective section of this article
      browser_options: remote_browser ? { "no-sandbox" => nil } : {},
      # Increase Chrome startup wait time (required for stable CI builds)
      process_timeout: 10,
      # Enable debugging capabilities
      inspector: true,
      # Allow running Chrome in a headful mode by setting HEADLESS env
      # var to a falsey value
      headless: !ENV["HEADLESS"].in?(%w[n 0 no false]),
    }.merge(remote_options)
  )
end

Capybara.javascript_driver = :cuprite
Capybara.default_driver = Capybara.javascript_driver
