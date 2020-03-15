import React, { Component, useRef } from 'react'
import Select from 'react-select'
import axios from 'axios'

import EventCard from './EventCard'
import './index.scss'

function Events(props) {
  const genresSelect = useRef(null);
  let events = []

  function renderEventsCards(events) {
    events = events
    return events.map((event) => {
      return (
        <EventCard styleClass={'card-item column is-4'} event={event} key={event.date}/>
      )
    })
  }

  function filterEvents() {
    let genre = genresSelect.current.select.state.selectValue

    axios.get(`/api/v1/events?filter[genre]=${genre[0].value}`)
      .then((response) => {
       events = response.data
        
      })

      console.log(events)
  }
 
  const eventGenresOptions = props.data.genres

  return (
    <div>
      <div className="card">
        <div className="card-content">
          <div className="media">
            <div className="media-content">
              <p className="title is-4">Eventos</p>
                Filtre eventos por genero:
              <div className="genreFilter">
                <Select
                  ref={genresSelect}
                  name="colors"
                  options={eventGenresOptions}
                  className="basic-multi-select"
                  classNamePrefix="select"
                />
                <button className="button is-success" onClick={filterEvents}>Pesquisar</button>
              </div>
               
            </div>

            <div className="media-action">
              <a href="/events/new" className="button is-success">Novo Evento</a>
            </div>
          </div>

          <br />
          <div className="item columns">
            {renderEventsCards(props.data.events)}
          </div>
        </div>
      </div>
    </div>
  )
} 

export default Events;
