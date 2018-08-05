const path = require('path')

module.exports = {
  module: {
    rules: [
      {
        test: /\.scss$/,
        loaders: ["style-loader", "css-loader", "sass-loader"],
        include: path.resolve(__dirname, '../')
      }
    ]
  },
  resolve: {
    alias: {
      actions: path.join(process.cwd(), 'app/javascript/bundles/Event', 'actions'),
      components: path.join(process.cwd(), 'app/javascript/bundles/Event', 'components'),
      constants: path.join(process.cwd(), 'app/javascript/bundles/Event', 'constants'),
      reducers: path.join(process.cwd(), 'app/javascript/bundles/Event', 'reducers'),
      store: path.join(process.cwd(), 'app/javascript/bundles/Event', 'store'),
      packs: path.join(process.cwd(), 'app/javascript', 'packs')
    }
  }
}
