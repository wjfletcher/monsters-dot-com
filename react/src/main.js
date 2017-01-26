import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';

$(function() {
  if (document.getElementById('recently-added-monsters')) {
    ReactDOM.render(
      <App />,
      document.getElementById('recently-added-monsters')
    );
  }
});
