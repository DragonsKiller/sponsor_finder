import React, { PropTypes, Component } from 'react';
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import * as courseActions from '../../actions/courseActions';
import {browserHistory} from 'react-router';
import IdeasList from './IdeasList';
import axios from 'axios';
class Ideas extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      ideas: []
    }
  }

  componentDidMount() {
    axios.get('http://localhost:3001/api/v1/ideas.json')
    .then(response => {
      console.log(response)
      this.setState({ideas: response.data})
    })
    .catch(error => console.log(error))
  }
  
  render() {
    console.log(this.state.ideas);
    return (
      <IdeasList ideas = { this.state.ideas }/>
    );
  }
}



function mapStateToProps(state, ownProps) {
  return {
    courses: state.ideas
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(courseActions, dispatch)
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Ideas);
