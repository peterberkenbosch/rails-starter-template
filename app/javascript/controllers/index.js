import { Application } from '@hotwired/stimulus'

// Import and register all your controllers from the importmap under controllers/*
import { registerControllersFrom } from '@hotwired/stimulus-importmap-autoloader'

const application = Application.start()

// Configure Stimulus development experience
application.warnings = true
application.debug = false
window.Stimulus = application
registerControllersFrom('controllers', application)
