import React from 'react';

const Monster = props => {
  let url = `/monsters/${props.id}`;

  return(
    <div className="large-4 small-12 column center-cropped recent-monster-box">
      <img className="recent-monster" src={props.img} />
      <br /><a href={url}><h4>{props.name}</h4></a>
    </div>
  );
};

export default Monster;
