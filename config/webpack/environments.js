const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    Turbo: ['@hotwired/turbo-rails', 'Turbo'],
    Stimulus: ['@hotwired/stimulus', 'Stimulus']
  })
)

module.exports = environment