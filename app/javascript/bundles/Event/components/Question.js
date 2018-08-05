import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import css from './question.scss'

import submitVote from 'actions/submitVote'

class Question extends Component {
  constructor (props) {
    super(props)

    this.handleVoteSubmit = this.handleVoteSubmit.bind(this)
  }

  handleVoteSubmit() {
    this.props.submitVote(this.props.id)
  }

  render() {
    const { weighted_score, contents } = this.props
    const voteString = weighted_score === 1 ? 'vote' : 'votes'

    return (
      <div className={`card ${css.questionContent}`}>
        <div className='card-body row'>
          <div className='col-lg-auto'>
            <div className='col-md-12' onClick={this.handleVoteSubmit}>
              <i className='fa fa-thumbs-up' />
            </div>
            <span>
              { `${weighted_score} ${voteString}` }
            </span>
          </div>
          <div className='col-lg'>
            { contents }
          </div>
        </div>
      </div>
    )
  }
}

Question.propTypes = {
  id: PropTypes.number.isRequired,
  contents: PropTypes.string.isRequired,
  weighted_score: PropTypes.number.isRequired,
  submitVote: PropTypes.func.isRequired
}

const mapDispatchToProps = {
  submitVote
}

export default connect(null, mapDispatchToProps)(Question)
