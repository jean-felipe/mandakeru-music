import React, { Component, useRef } from 'react'
import { Form } from '@unform/web'
import Select from 'react-select'

import Input from './Input'

export default function EventForm() {
  const formRef = useRef(null);
  const artistSelect = useRef(null);
  const concertSelect = useRef(null);

  const eventTypeOptions = [
    { value: 'concert', label: 'Show Solo' },
    { value: 'festival', label: 'Festival' }
  ]

  const eventArtistsOptions = [
    { value: '1', label: 'Joao' },
    { value: '2', label: 'Maria' }
  ]

  function handleSubmit() {
    const allData = formRef.current.getData();
    const artists = artistSelect.current.select.state.selectValue
    const concertType = concertSelect.current.select.state.selectValue

    console.log(allData, concertType, artists)
  }

  return (
    <div className="form">
      <h2>Crie seu Evento</h2>
      <hr />
      <Form ref={formRef} onSubmit={handleSubmit}>
        Nome do Evento: <Input name="name" className="input"/>
        Data: <Input name="date" className="input" type="date" />
        Hora: <Input name="time" className="input" type="time" />
        
        <hr />
        Escolha o tipo do evento:
        <Select
          ref={concertSelect}
          options={eventTypeOptions} 
          defaultValue={eventTypeOptions[0]} 
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

        <hr />
        <button type="submit" className="button is-primary is-fullwidth">
          Criar
          </button>
      </Form>

    </div>
  )
}
