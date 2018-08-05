import ReactOnRails from 'react-on-rails'

export default () => {
  const tokens = ReactOnRails.authenticityHeaders()
  const contentType = { 'Content-Type': 'application/json' }

  const headers = Object.assign({}, tokens, contentType)
  return headers
}
