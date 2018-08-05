const merge = require('webpack-merge')
process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')
const customConfig = require('./custom')

module.exports = merge(environment.toWebpackConfig(), customConfig)
