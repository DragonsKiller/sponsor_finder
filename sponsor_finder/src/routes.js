import React from 'react';
import { Route, IndexRoute, Redirect } from 'react-router';
import Layout from './components/Layout';
import Ideas from './components/ideas/Ideas';
import ManageIdeaPage from './components/ideas/ManageIdeaPage';
import Idea from './components/ideas/Idea';
export default (
  <Route path = "/" component = { Layout }>
    <IndexRoute component = { Ideas } />
    <Route path = "ideas/new" component = { ManageIdeaPage } />
    <Route path = "ideas/:id/edit" component = { ManageIdeaPage } />
    <Route path = "ideas/:id" component = { Idea } />
  </Route>
);
