// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'

import 'bulma/css/bulma.css';
// import './../node_modules/bulma/css/bulma.css';

import Main from '../components/Main/Main'

document.addEventListener('DOMContentLoaded', () => {
  const element = document.getElementById('dashboard')
  const rawData = Object.assign({}, element.dataset);

  const propsData = Object.keys(rawData).reduce((acc, prop) => {
    acc[prop] = JSON.parse(rawData[prop]);
    return acc;
  }, {});

  ReactDOM.render(
    <Main data={propsData}/>,
    document.body.appendChild(document.createElement('div')),
  )
})
