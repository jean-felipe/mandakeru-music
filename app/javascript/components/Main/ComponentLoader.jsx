import React, { Component } from 'react';

import Events from '../Events/Events'

class ComponentLoader extends Component {
  components = {
    eventList: Events
  };

  render() {
    const TagName = this.components[this.props.tag || 'eventList'];
    return <TagName data={this.props.data}/>
  }
}
export default ComponentLoader;
