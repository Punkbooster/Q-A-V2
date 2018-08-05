import actionTypes from 'constants'

export const resetShouldBeDisplayed = () => dispatch => {
  dispatch({
    type: actionTypes.RESET_SHOULD_BE_DISPLAYED,
    payload: null
  })
}

export const showAlert = (message) => {
  return {
    type: actionTypes.SHOW_ALERT,
    message: message
  }
}
