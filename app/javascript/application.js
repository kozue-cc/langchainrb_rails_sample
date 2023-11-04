// Import libraries
import { Turbo } from "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

// Stimulus setup
const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// Your own JavaScript code
// ...