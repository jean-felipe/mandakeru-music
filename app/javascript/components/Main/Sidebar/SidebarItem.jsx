import React from 'react'
// import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { Link } from 'react-router-dom'

function SidebarItem(props) {


  return(
    <a href={props.url} className="menu-link">
      <i className={props.icon}></i>
      <p className="title is-4 has-text-white">{props.label}</p>
    </a>
  )
}

export default SidebarItem;
