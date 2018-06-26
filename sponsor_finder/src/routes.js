import React from 'react';
import { Route, IndexRoute } from 'react-router';
import Layout from './components/Layout';
import Ideas from './components/ideas/Ideas';
import ManageIdeaPage from './components/ideas/ManageIdeaPage';

export default (
  <Route path = "/" component = { Layout }>
    <IndexRoute component = { Ideas } />
    <Route path = "idea" component = { ManageIdeaPage } />
    <Route path = "idea/:id" component = { ManageIdeaPage } />
  </Route>
);
