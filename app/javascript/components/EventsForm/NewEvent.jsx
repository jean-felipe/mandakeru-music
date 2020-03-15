import React, { Component } from 'react';
import axios from 'axios'

import EventForm from './EventForm';

export default class NewEvent extends Component {
  artists = []
  genres = []

  componentWillMount() {
    axios.get('/api/v1/artists').then((response) => {
      response.data.forEach((artist) => {
        this.artists.push(artist)
      })
    })

    axios.get('/api/v1/genres').then((response) => {
      response.data.forEach((genre) => {
        this.genres.push(genre)
      })
    })
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
              <EventForm artists={this.artists} genres={this.genres}/>
            </div>
          </div>
        </div>
      </div>
    )
  }
}
