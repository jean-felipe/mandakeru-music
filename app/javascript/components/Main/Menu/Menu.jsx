import React, { Component } from 'react'
import './Menu.scss';

class Menu extends Component {
  render() {
    return(
      <nav className="navbar">
        <div className="container">
          <div className="navbar-brand">
            <div className="navbar-item">
              <a className="brand" href="/">
                <div className="brand-icon">
                </div>
                <div className="brand-content">

                </div>
              </a>
            </div>

            <div className="navbar-burger burger" data-target="mainNav"> <span></span><span></span><span></span> </div>
          </div>

          <div className="navbar-menu">
            <div className="navbar-end">
              <div className="navbar-item">
                <div className="field is-grouped">
                  <p className="control">

                  </p>
                  <p className="control">
                    <a className="bd-tw-button button" href="#">
                      <span className="icon">
                        <i className="far fa-user-circle"></i>
                      </span>
                      <span>
                        Sua Conta
                  </span>
                    </a>
                  </p>
                  <p className="control">
                    <a className="button is-danger" href="#">
                      <span className="icon">
                        <i className="fas fa-sign-out-alt"></i>
                      </span>
                      <span>Sair</span>
                    </a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div >
      </nav >
    )
  }
}

export default Menu
