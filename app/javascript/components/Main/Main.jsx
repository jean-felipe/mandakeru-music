import React, { Component } from 'react'

import Sidebar from './Sidebar/Sidebar'
import Menu from './Menu/Menu'

import './Main.scss'

class Main extends Component {
  render() {
    const name = this.props.data.user.name;
    console.log(this.props)
    return (
      <div className="dashboard">
        <Sidebar storeName={name}/>
            <div className="main-panel">
          <Menu />
          <div className="content">
            
          </div>
        </div>
      </div>
    )
  }
}

export default Main
