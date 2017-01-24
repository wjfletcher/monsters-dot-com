import React from 'react'

const Monster = props => {
  return(
    <div>
      <h1 className="columns small-offset-2 small-centered">{props.name}</h1>
      <img src={props.img} width="300" height="200"/>
      <p className="columns small-offset-2 small-centered">
        <a href={props.source}>
          <strong>About Me</strong>
        </a>
      </p>
      <p className="columns small-offset-2 small-centered">Description: {props.description}</p>
    </div>
  )
}

export default Monster;
