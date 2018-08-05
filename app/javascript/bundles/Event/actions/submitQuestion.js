import actionTypes from 'constants'
import ReactOnRails from 'react-on-rails'
import headers from 'packs/headers'

import { showAlert } from './alertActions'

export default (contents, event_id) => dispatch => {

  fetch('/api_questions.json', {
    method: 'POST',
    credentials: 'same-origin',
    body: JSON.stringify({ question: { contents, event_id } }),
    headers: headers()
  })
    .then(response => response.json())
    .then(response => {
      dispatch(submitQuestionSuccess(response))
      dispatch(showAlert('Question submitted!'))
    })
    .catch(error => error)
}

function submitQuestionSuccess (questions) {
  return {
    type: actionTypes.SUBMIT_QUESTION_SUCCESS,
    payload: questions
  }
}
