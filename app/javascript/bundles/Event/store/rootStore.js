import React from 'react'
import ReactOnRails from 'react-on-rails'
import { Provider } from 'react-redux'
import thunkMiddleware from 'redux-thunk'
import reducer, { initialStates } from '../reducers'
import { createStore, applyMiddleware, compose } from 'redux'
import logger from 'redux-logger'

const DevTools = require('packs/devTools').default
const isDevEnv = process.env.NODE_ENV === 'development'

export default props => {
  const user_attr = props.user.data
  const event_attr = props.event.data.attributes
  const event_questions = props.event
                               .included
                               .map(question => question.attributes)

  const { userState, eventState, alertState } = initialStates
  const initialState = {
    userStore: {...userState,
      id: user_attr && user_attr.attributes && user_attr.attributes.id,
      email: user_attr && user_attr.attributes && user_attr.attributes.email
    },
    eventStore: {...eventState,
      id: event_attr.id,
      title: event_attr.title,
      description: event_attr.description,
      starts_at: event_attr.starts_at,
      ends_at: event_attr.ends_at,
      questions: event_questions
    },
    alertStore: {...alertState}
  }

  const store = () => {
    if (isDevEnv) {
      const composedStore = compose(
        applyMiddleware(thunkMiddleware, logger),
        DevTools.instrument()
      )
      return createStore(reducer, initialState, composedStore)
    } else {
      const composedStore = compose(applyMiddleware(thunkMiddleware))
      return createStore(reducer, initialState, composedStore)
    }
  }
  return store()
}
