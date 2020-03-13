import React from 'react'
import SidebarItem from './SidebarItem'

import './Sidebar.scss';

function Sidebar(props) {

  return(
    <div className="sidebar">
      <div className="logo">
        <span className="logo-text title is-6">
          {props.storeName}
        </span>
        <hr className="logo-hr" />
      </div>
      <div className="sidebarWrapper">
        <ul className="menu">
          <li className="menu-item">
            <SidebarItem
              url="/events"
              icon="far fa-calendar-alt"
              label="Eventos"
            />
          </li>

          <li className="menu-item">
            <SidebarItem
              url="/dashboard/produtos"
              icon='fas fa-users'
              label="Artistas"
            />
          </li>
          <li className="menu-item">
            <SidebarItem
              url="/dashboard/vendas"
              icon='fas fa-guitar'
              label="Gêneros Musicais"
            />
          </li>

        </ul>
      </div>
    </div>
  )
}

export default Sidebar;
