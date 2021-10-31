// Rails functionality
import { Turbo } from '@hotwired/turbo-rails'

// ActionCable Channels
import './channels'

// Stimulus controllers
import './controllers'

// Make accessible for Electron and Mobile adapters
window.Turbo = Turbo
