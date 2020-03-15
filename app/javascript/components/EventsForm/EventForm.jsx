import React, { Component, useRef } from 'react'
import { Form } from '@unform/web'
import { Scope } from '@unform/core'
import Select from 'react-select'
import axios from 'axios'

import Input from './Input'
import "../Events/index.scss";

export default function EventForm(props) {
  const formRef = useRef(null);
  const artistSelect = useRef(null);
  const concertSelect = useRef(null);
  const genresSelect = useRef(null);

  const eventTypeOptions = [
    { value: 'concert', label: 'Show Solo' },
    { value: 'festival', label: 'Festival' }
  ]

  const eventArtistsOptions = props.artists
  const eventGenresOptions = props.genres

  function handleSubmit() {
    const allData = formRef.current.getData();
    const artists = artistSelect.current.select.state.selectValue
    const genres = genresSelect.current.select.state.selectValue
    const concertType = concertSelect.current.select.state.selectValue

    const params = {
      event: {
        name: allData.name,
        date: allData.date,
        time: allData.time,
        eventType: concertType[0].value,
        lineup: allData.lineup,
        address: allData.address,
        artists: artists,
        genres: genres
      }
    }

    axios.post('/api/v1/events', params).then((response) => {
      window.location = '/'
    })
  }

  return (
    <div className="form">      
      <h2>Crie seu Evento</h2>
      <hr />
      <Form ref={formRef} onSubmit={handleSubmit}>
        Nome do Evento: <Input name="name" className="input" required/>
        Data: <Input name="date" className="input" type="date" required/>
        Hora: <Input name="time" className="input" type="time" required/>
        
        <hr />
        Escolha o tipo do evento:
        <Select
          ref={concertSelect}
          options={eventTypeOptions} 
          defaultValue={eventTypeOptions[0]} 
        />

        <br />
        Escolha os Gêneros musicais do evento:
        <Select
          ref={genresSelect}
          isMulti
          name="colors"
          options={eventGenresOptions}
          className="basic-multi-select"
          classNamePrefix="select"
        />

        <br />
        Artistas presentes no evento(lineup)
        <Select
          ref={artistSelect}
          isMulti
          name="colors"
          options={eventArtistsOptions}
          className="basic-multi-select"
          classNamePrefix="select"
        />

        <br />
        Nome do Lineup: <Input name="lineup" className="input" required />

        <hr />
        Endereço:
        <br />
        <Scope path="address">
          Cep:
          <Input name="zipcode" className="input" placeholder="CEP" required />
          <br />
          Rua:
          <Input name="street" className="input"  placeholder="Rua Joao Antunes" required />
          <br />
          Bairro:
          <Input name="neighborhood" className="input"  placeholder="Tangua" required />
          <br />
          Cidade
          <Input name="city" className="input"  placeholder="São Joao Paulista" required />
          <br />
          Estado:
          <Input name="state" className="input"  placeholder="São paulo" required />
          <br />
          Número:
          <Input name="number" className="input"  type="number" placeholder="12" required />
          Complemento:
          <Input name="complement" className="input" placeholder="apto 102" />
        </Scope>
        
        <hr />
        <button type="submit" className="button is-primary is-fullwidth">
          Criar
          </button>
      </Form>

    </div>
  )
}
