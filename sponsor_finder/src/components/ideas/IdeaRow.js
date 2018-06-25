import React from "react"
import PropTypes from "prop-types";

const IdeaRow = ({ idea }) => {
  return (
    <tr>
      <th scope="row"> { idea.id } </th>
      <td>{ idea.name }</td>
      <td>{ idea.description }</td>
      <td>{ idea.problem }</td>
      <td>{ idea.industry }</td>
      <td>{ idea.team }</td>
      <td>{ idea.geographicalFocus }</td>
      <td>{ idea.requirements }</td>
      <td>{ idea.nextSteps }</td>
    </tr>
  );
};

export default IdeaRow;
