import React, { Component } from 'react'
import './index.scss'

import Event from './Event'

export default class EventCard extends Component {
  renderEvents() {
    return this.props.event.events.map((event) => {
     return(
       <Event event={event} key={event.id} />
     )
    })
  }

  render() {
    const date = this.props.event.date;

    return(
      <div className={"card " + this.props.styleClass}>

        <div className="card-content">
          <div className="media">
            <div className="media-left">
              <figure className="image is-128x128">
                <img src="https://picsum.photos/128/128" alt="Placeholder image" />
              </figure>
            </div>

            <div className="media-content">
              <p className="title is-4">{date}</p>
            </div>
          </div>

            <div className="content">
              <h2>Eventos:</h2>
             { this.renderEvents() }
            </div>
          </div>
      </div>
    )
  }
}
