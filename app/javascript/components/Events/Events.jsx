import React, { Component } from 'react'

class Events extends Component {
  renderTableData() {
    return this.props.data.events.map((event, index) => {
      const { id, name, event_date, event_private, event_type } = event //destructuring
      return (
        <tr key={id}>
          <td>{id}</td>
          <td>{name}</td>
          <td>{event_date}</td>
          <td>{event_private}</td>
          <td>{event_type}</td>
        </tr>
      )
    })
  }

  render() {
    console.log(this.props)
    console.log(this.renderTableData())
    const events = this.props.data.events

    return (
      <div>
        <div className="card">
          <div className="card-content">
            <div className="media">
              <div className="media-content">
                <p className="title is-4">Eventos</p>
                <p className="subtitle is-6">Gerenciamento de produtos</p>
              </div>

              <div className="media-action">
                <button className="button is-success">Novo Evento</button>
              </div>
            </div>

            <br />
            <div className="content">
              <table className="table is-striped">
                <thead>
                  <tr>
                    <th><abbr title="Position">id</abbr></th>
                    <th>name</th>
                    <th><abbr title="Played">date</abbr></th>
                    <th><abbr title="Won">event_private</abbr></th>
                    <th><abbr title="Drawn">event_type</abbr></th>
                  </tr>
                </thead>
                <tbody>
                  {this.renderTableData()}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    )
  }
} 

export default Events;
