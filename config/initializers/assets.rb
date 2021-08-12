# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# Configure importmap paths in addition to having all files in app/assets/javascripts mapped.
Rails.application.config.importmap.paths.tap do |paths|
  # Match libraries with their NPM package names for possibility of easy later porting.
  # Ensure that libraries listed in the path have been linked in the asset pipeline manifest or precompiled.

  # paths.asset "@rails/actioncable", path: "actioncable.esm.js"
  # paths.asset "@rails/actiontext", path: "actiontext.js"
  # paths.asset "@rails/activestorage", path: "activestorage.esm.js"

  # Make all files in directory available as my_channel => channels/my_channel-$digest.js
  paths.assets_in "lib/assets/javascripts/libraries", append_base_path: true
end
