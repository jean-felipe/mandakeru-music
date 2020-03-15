import React, { Component } from 'react'

export default class Event extends Component {
  renderGenreList() {
    return this.props.event.genres.map((genre) => {
      return (
      <li key={genre.id}>{genre.name}</li>
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
      <article className="message is-dark">
        <div className="message-header">
          <p>{event.name}</p>
        </div>
        <div className="message-body">
          <p>Data: {event.event_date}</p>
          <p>Tipo: {event.event_type}</p>
          Generos: {this.renderGenreList()}
          <br />
          Artistas: {this.renderArtistList()}
          <br />
          Endereço: {event.address}
        </div>
        
      </article>
    )
  }
}
