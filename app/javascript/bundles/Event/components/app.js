import React from 'react'
import ReactOnRails from 'react-on-rails'
import { Provider } from 'react-redux'
import { Provider as AlertProvider } from 'react-alert'
import AlertTemplate from 'react-alert-template-basic'

import Event from './Event'

const alertOptions = {
  position: 'bottom center',
  timeout: 5000,
  offset: '30px',
  transition: 'scale'
}

const DevTools = require('packs/devTools').default
const isDevEnv = process.env.NODE_ENV === 'development'

export default () => (
  <Provider store={ReactOnRails.getStore('eventStore')}>
    <AlertProvider template={AlertTemplate} {...alertOptions}>
      <Event />
      {isDevEnv && <DevTools />}
    </AlertProvider>
  </Provider>
)
