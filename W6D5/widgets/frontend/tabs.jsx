import React from "react";

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state =  {selectedIdx: 0};
  }

  render(){
    let tabArr = JSON.parse(this.props.options);
    return (
      <ul>
        {tabArr.map((tab, idx) => <h1 key={tab.title + idx}>{tab.title}</h1>)}
      </ul>
    );
  }
}

export default Tabs;
