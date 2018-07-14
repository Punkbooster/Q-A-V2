import React from 'react';
import ReactOnRails from 'react-on-rails';
import { Provider } from 'react-redux';

import createStore from '../bundles/Event/store/eventStore';
import EventApp from '../bundles/Event/components/EventApp';

// See documentation for https://github.com/reactjs/react-redux.
// This is how you get props from the Rails view into the redux store.
// This code here binds your smart component to the redux store.
// railsContext provides contextual information especially useful for server rendering, such as
// knowing the locale. See the React on Rails documentation for more info on the railsContext
const EventApp = (props, _railsContext) => {
  const store = createStore(props);
  const reactComponent = (
    <Provider store={store}>
      <EventApp />
    </Provider>
  );
  return reactComponent;
};

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ EventApp });
