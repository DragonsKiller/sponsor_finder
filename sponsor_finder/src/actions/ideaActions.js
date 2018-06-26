import * as types from '../constants';
import axios from 'axios';

export function loadIdeasSuccess(ideas) {
  return { type: types.LOAD_IDEAS_SUCCESS, ideas };
}

export function createIdeaSuccess(idea) {
  return {type: types.CREATE_IDEA_SUCCESS, idea};
}

export function updateIdeaSuccess(idea) {
  return {type: types.UPDATE_IDEA_SUCCESS, idea};
}

export function loadIdeas() {
  return function(dispatch) {
    return axios.get('http://localhost:3001/api/v1/ideas.json').then(ideas => {
      dispatch(loadIdeasSuccess(ideas.data));
    }).catch(error => {
      throw(error);
    });
  };
}

export function saveIdea(idea) {
  return function(dispatch) {
    dispatch(updateIdeaSuccess(idea));
    dispatch(createIdeaSuccess(idea));
  }
}
