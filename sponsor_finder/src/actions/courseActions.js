import * as types from '../constants';

export function loadIdeasSuccess(ideas) {
  return { type: types.LOAD_IDEAS_SUCCESS, ideas };
}

export function loadIdeas() {
  return function(dispatch) {

  };
}
