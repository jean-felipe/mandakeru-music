import React, { Component } from 'react'

import EventCard from './EventCard'
import './index.scss'

class Events extends Component {
  renderEventsCards() {
    return this.props.data.events.map((event) => {
      return (
        <EventCard styleClass={'card-item column is-4'} event={event} key={event.date}/>
      )
    })
  }

  render() {
    const events = this.props.data.events
    console.table(events)
    return (
      <div>
        <div className="card">
          <div className="card-content">
            <div className="media">
              <div className="media-content">
                <p className="title is-4">Eventos</p>
                <p className="subtitle is-6"></p>
              </div>

              <div className="media-action">
                <button className="button is-success">Novo Evento</button>
              </div>
            </div>

            <br />
            <div className="item columns">
              { this.renderEventsCards() }              
            </div>
          </div>
        </div>
      </div>
    )
  }
} 

export default Events;
