import React from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as ideaActions from '../../actions/ideaActions';
import IdeaForm from './IdeaForm';

export class ManageIdeaPage extends React.Component {
  constructor(props, context) {
    super(props, context);

    this.state = {
      idea: Object.assign({}, props.idea),
      errors: {}
    };
    this.updateIdeaState = this.updateIdeaState.bind(this);
    this.saveIdea = this.saveIdea.bind(this);
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.idea.id != nextProps.idea.id) {
      // Necessary to populate form when existing idea is loaded directly.
      this.setState({ idea: Object.assign({}, nextProps.idea) });
    }
  }

  updateIdeaState(event) {
    const field = event.target.name;
    let idea = this.state.idea;
    idea[field] = event.target.value;
    return this.setState({ idea: idea });
  }

  saveIdea(event) {
    event.preventDefault();
    this.props.actions.saveIdea(this.state.idea)
    this.context.router.push('/')
  }

  render() {
    return (
      <IdeaForm
        onChange = { this.updateIdeaState }
        onSave = { this.saveIdea }
        idea = { this.state.idea }
        errors = { this.state.errors }
      />
    );
  }
}

//Pull in the React Router context so router is available on this.context.router.
ManageIdeaPage.contextTypes = {
  router: PropTypes.object
};

function getIdeaById(ideas, id) {
  const idea = ideas.filter(idea => idea.id == id);
  if (idea) return idea[0]; //since filter returns an array, have to grab the first.
  return null;
}


function mapStateToProps(state, ownProps) {
  const ideaId = ownProps.params.id; // from the path `/idea/:id`

  let idea = {id: '', watchHref: '', title: '', trader_id: '', length: '', category: ''};

  if (ideaId && state.ideas.length > 0) {
    idea = getIdeaById(state.ideas, ideaId);
  }

  return {
    idea: idea
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(ideaActions, dispatch)
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(ManageIdeaPage);
