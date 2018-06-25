import * as types from '../constants';
import initialState from './initialState';

export default function ideaReducer(state = initialState.ideas, action) {
  switch(action.type) {
    case types.LOAD_IDEAS_SUCCESS:
      return action.courses;

    default:
      return state;
  }
}
