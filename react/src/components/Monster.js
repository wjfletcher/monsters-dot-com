import React from 'react'

const Monster = props => {
  return(
    <div>
      <h1 className="columns small-offset-2 small-centered">{props.name}</h1>
      <p className="columns small-offset-2 small-centered"><strong>{props.source}</strong></p>
      <p className="columns small-offset-2 small-centered">{props.img}</p>
      <p className="columns small-offset-2 small-centered">{props.description}</p>
    </div>
  )
}

export default Monster;
