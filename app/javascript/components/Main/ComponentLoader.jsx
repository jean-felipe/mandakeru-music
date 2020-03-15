import React, { Component } from 'react';

import Events from '../Events/Events'
import NewEvent from '../EventsForm/NewEvent';

class ComponentLoader extends Component {
  components = {
    eventList: Events,
    newEvent: NewEvent
  };

  render() {
    const TagName = this.components[this.props.tag || 'eventList'];
    return <TagName data={this.props.data}/>
  }
}
export default ComponentLoader;
