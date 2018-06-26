import React, { PropTypes, Component } from 'react';
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import * as courseActions from '../../actions/ideaActions';
import {browserHistory} from 'react-router';
import IdeasList from './IdeasList';
import axios from 'axios';

class Ideas extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.redirectToAddIdeaPage = this.redirectToAddIdeaPage.bind(this);
  }

  redirectToAddIdeaPage() {
    browserHistory.push('/idea');
  }

  render() {
    const { ideas } = this.props;

    console.log(ideas);
    return (
      <div>
        <h1>Ideas</h1>
        <input type="submit"
               value="Add Course"
               className="btn btn-primary"
               onClick={this.redirectToAddIdeaPage}
        />
      <IdeasList ideas = { ideas }/>
      </div>
    );
  }
}


function mapStateToProps(state, ownProps) {
  return {
    ideas: state.ideas
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(courseActions, dispatch)
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Ideas);
