import React, { Component } from 'react'

export default class Event extends Component {
  renderGenreList() {
    return this.props.event.genres.map((genre) => {
      return (
      <p key={genre.id}>{genre.name}</p>
      )
    })
  }

  renderArtistList() {
    return this.props.event.artists.map((artist) => {
      return (
        <li key={artist.id}>{artist.name}</li>
      )
    })
  }
  render() {
    event = this.props.event
    return(
      <article class="message is-dark">
        <div class="message-header">
          <p>{event.name}</p>
        </div>
        <div class="message-body">
          <p>Data: {event.event_date}</p>
          <p>Tipo: {event.event_type}</p>
          Generos: {this.renderGenreList()}
          Artistas: {this.renderArtistList()}
        </div>
        
      </article>
    )
  }
}
