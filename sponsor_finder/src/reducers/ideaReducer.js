import * as types from '../constants';
import initialState from './initialState';

export default function ideaReducer(state = initialState.ideas, action) {
  switch(action.type) {
    case types.LOAD_IDEAS_SUCCESS:
      console.log(action.ideas);
      return action.ideas;

    case types.CREATE_IDEA_SUCCESS:
      return [
        ...state,
        Object.assign({}, action.idea)
      ];

    case types.UPDATE_IDEA_SUCCESS:
      return [
        ...state.filter(idea => idea.id !== action.idea.id),
        Object.assign({}, action.idea)
      ];

    default:
      return state;
  }
}
