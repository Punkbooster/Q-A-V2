import { combineReducers } from 'redux'

import eventReducer, { initialState as eventState} from './eventReducer'
import userReducer, { initialState as userState } from './userReducer'
import alertReducer, { initialState as alertState } from './alertReducer'

export const initialStates = {
  eventState,
  userState,
  alertState
}

export default combineReducers({
  userStore: userReducer,
  eventStore: eventReducer,
  alertStore: alertReducer
})
