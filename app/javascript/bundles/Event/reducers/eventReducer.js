import actionTypes from 'constants/index'

export const initialState = {
  id: null,
  title: null,
  description: null,
  starts_at: null,
  ends_at: null,
  questions: []
}

export default function (state = initialState, action) {
  switch (action.type) {
    case actionTypes.SUBMIT_QUESTION_SUCCESS:
      return {
        ...state,
        questions: action.payload
      }
    case actionTypes.SUBMIT_VOTE_SUCCESS:
      return {
        ...state,
        questions: action.payload
      }
    default:
      return state
  }
}
