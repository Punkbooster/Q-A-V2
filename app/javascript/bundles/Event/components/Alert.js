import React from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'

import { resetShouldBeDisplayed } from 'actions/alertActions'

const Alert = (props) => {
  // :TODO: rewrite without warning
  if (props.shouldBeDisplayed) {
    props.resetShouldBeDisplayed()
    props.alert.show(props.message)
  }

  return (
    <div></div>
  )
}

Alert.propTypes = {
  alert: PropTypes.object.isRequired,
  shouldBeDisplayed: PropTypes.bool.isRequired,
  message: PropTypes.string,
  resetShouldBeDisplayed: PropTypes.func.isRequired
}

const mapStateToProps = state => ({
  shouldBeDisplayed: state.alertStore.shouldBeDisplayed,
  message: state.alertStore.message
})

const mapDispatchToProps = {
  resetShouldBeDisplayed
}

export default connect(mapStateToProps, mapDispatchToProps)(Alert)
