import React, {PropTypes} from 'react';
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import * as courseActions from '../../actions/courseActions';
import {browserHistory} from 'react-router';
import IdeasList from './IdeasList'

class Ideas extends React.Component {
  render() {
    const ideas = [
      {
        id: 1, name: "qwert", description: "dfghm", problem: "sdfghnm", industry: "dfvbn", team: "dfbnm", geographicalFocus: "dfgbnm", requirements: "dfgbn", nextSteps: "dfgbnm"
      },
      {
        id: 3, name: "qwertq", description: "q", problem: "q", industry: "q", team: "q", geographicalFocus: "q", requirements: "q", nextSteps: "q"
      }
    ];
    console.log(ideas);
    return (
      <IdeasList ideas = { ideas }/>
    );
  }
}



function mapStateToProps(state, ownProps) {
  return {
    courses: state.courses
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(courseActions, dispatch)
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Ideas);
