import actionTypes from 'constants/index'

export const initialState = {
  shouldBeDisplayed: false,
  message: '',
  type: null
}

export default function (state = initialState, action) {
  switch (action.type) {
    case actionTypes.RESET_SHOULD_BE_DISPLAYED:
      return {
        ...state,
        shouldBeDisplayed: false
      }
    case actionTypes.SHOW_ALERT:
      return {
        ...state,
        shouldBeDisplayed: true,
        message: action.message
      }
    default:
      return state
  }
}
