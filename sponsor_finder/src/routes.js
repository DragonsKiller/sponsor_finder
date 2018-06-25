import React from 'react';
import { Route, IndexRoute } from 'react-router';
import Layout from './components/Layout';
import Ideas from './components/ideas/Ideas';

export default (
  <Route path = "/ideas" component = { Layout }>
    <IndexRoute component = { Ideas } />
  </Route>
);
