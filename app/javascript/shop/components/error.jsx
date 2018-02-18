import React from 'react'
import { Redirect } from 'react-router-dom'

const Error = ({ errors, error_code, pathname }) => {

  if ([422].includes(error_code) && pathname !== '/') {
    return <Redirect to='/'/>
  }

  return (
    <div>
      <h3>Sorry, server returned some errors:</h3>
      { errors.map( (error, index) =>
        <div key={index}>{error}</div>
      )}
    </div>
  )
}

export default Error