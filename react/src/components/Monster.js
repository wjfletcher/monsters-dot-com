import React from 'react';

const Monster = props => {
  return(
    <div className="large-4 small-12 column center-cropped">
      <img className="recent-monster" src={props.img} />
      <br /><a href={props.source}><h4>{props.name}</h4></a>
    </div>
  );
};

export default Monster;
