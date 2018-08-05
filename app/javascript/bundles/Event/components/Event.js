import React, { Component } from 'react'
import { connect } from 'react-redux'
import PropTypes from 'prop-types'
import { withAlert } from 'react-alert'

import Question from './Question'
import Alert from './Alert'
import submitQuestion from 'actions/submitQuestion'

class Event extends Component {
  constructor (props) {
    super(props)

    this.state = {
      question_val: '',
    }

    this.handleInputChange = this.handleInputChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleInputChange (event) {
    this.setState({
      question_val: event.target.value
    })
  }

  handleSubmit (e) {
    e.preventDefault()
    const event_id = this.props.eventState.id
    const question_val = this.state.question_val

    this.props.submitQuestion(question_val, event_id)
  }

  _questionsContainer (questions) {
    return (
      <div className='event-questions-container'>
        { questions.map(question => (
          <Question
            key={question.id}
            id={question.id}
            contents={question.contents}
            weighted_score={question.weighted_score}
          />
        ))}
      </div>
    )
  }

  _questionForm () {
    return (
      <div className='event-question-form card-header bg-warning'>
          <form onSubmit={this.handleSubmit}>
            <div className='form-group'>
              <textarea
                className='form-control'
                type='text'
                id='question_id'
                value={this.state.question_val}
                onChange={this.handleInputChange}
                placeholder='Do You have a question?'
                maxLength='100'
              />
              <input
                className='btn btn-info add-question-submit'
                type='submit'
                name='commit'
                value='Ask'
              />
            </div>
          </form>
      </div>
    )
  }

  _eventHeader (title, description) {
    return (
      <div>
        <h2 className='card-header bg-warning'>
          { title }
        </h2>
        <h4 className='card-header bg-warning'>
          { description }
        </h4>
      </div>
    )
  }

  render() {
    const { title, description, questions } = this.props.eventState

    return (
      <div className='row'>
        <div className='col-lg-2' />
        <div className='col-lg-8'>
          <div className='event-container'>
            <div className='card border-warning'>
              <Alert alert={ this.props.alert } />
              { this._eventHeader(title, description) }
              { this._questionForm() }
            </div>
            { this._questionsContainer(questions) }
          </div>
        </div>
        <div className='col-lg-2' />
      </div>
    )
  }
}

Event.propTypes = {
  eventState: PropTypes.object.isRequired,
  userState: PropTypes.object.isRequired,
  submitQuestion: PropTypes.func.isRequired,
  alert: PropTypes.object.isRequired
}

const mapStateToProps = state => ({
  eventState: state.eventStore,
  userState: state.userStore
})

const mapDispatchToProps = {
  submitQuestion
}

export default withAlert(connect(mapStateToProps, mapDispatchToProps)(Event))
