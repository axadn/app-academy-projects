import React from 'react';
import ReactDOM from 'react-dom';
import App from './app';
import  {Provider}  from 'react-redux';

const Root = ({ store }) => {
  return (
   <Provider store={ store }>
      <App />
   </Provider>
);
};



export default Root;
