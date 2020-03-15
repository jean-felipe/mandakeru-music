import React, { Component } from 'react';

import EventForm from './EventForm';

export default class NewEvent extends Component {
  componentDidMount() {
    console.log('did')
  }

  render() {
    return(
      <div>
        <div className="card">
          <div className="card-content">
            <div className="media">
              <div className="media-content">
                <p className="subtitle is-6"></p>
              </div>

              <div className="media-action">
                <button className="button is-danger">Cancelar</button>
              </div>
            </div>

            <br />
            <div className="item columns">
              <EventForm />
            </div>
          </div>
        </div>
      </div>
    )
  }
}
