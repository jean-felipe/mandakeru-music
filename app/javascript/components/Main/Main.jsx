import React, { Component } from 'react'

import Sidebar from './Sidebar/Sidebar'
import Menu from './Menu/Menu'

import ComponentLoader from './ComponentLoader'

import './Main.scss'

class Main extends Component {
  render() {
    const name = this.props.data.user.name;
    const component = this.props.data.component.name
    
    return (
      <div className="dashboard">
        <Sidebar storeName={name}/>
            <div className="main-panel">
          <Menu />
          <div className="content">
            <ComponentLoader tag={component} data={this.props.data}/>
          </div>
        </div>
      </div>
    )
  }
}

export default Main
