# Configure import map to be used for ESM
Rails.application.config.importmap.draw do
  # All JavaScript files in the tree are mapped to their name
  pin_all_from "app/assets/javascripts"

  # Match libraries with their NPM package names for possibility of later porting.
  # Ensure that libraries listed in the path have been linked in the asset pipeline manifest or precompiled.
  # pin "@rails/actioncable", to: "actioncable.esm.js"
  # pin "@rails/activestorage", to: "activestorage.esm.js"
  # pin "@rails/actiontext", to: "actiontext.js"
  # pin "trix", to: "trix.js"

  # Use libraries directly from JavaScript CDNs
  # pin "vue", to: "https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.esm.browser.js"
  # pin "d3", to: "https://cdn.skypack.dev/pin/d3@v7.0.0-03vFl9bie0TSesDkWTJV/mode=imports/optimized/d3.js"

  # Pin vendored modules by first adding the following to app/assets/config/manifest.js:
  # //= link_tree ../../../vendor/assets/javascripts .js
  # pin_all_from "vendor/assets/javascripts"
  pin_all_from "lib/assets/javascripts/libraries", append_base_path: true
end
