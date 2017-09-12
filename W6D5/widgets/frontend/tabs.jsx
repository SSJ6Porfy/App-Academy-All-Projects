import React from "react";

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {selectedIdx: 0};
    this.updateTab = this.updateTab.bind(this);
  }

  updateTab(props) {
    if (props._dispatchInstances._currentElement.key === "tab32") {
      this.setState({selectedIdx: 2});
    } else if (props._dispatchInstances._currentElement.key === "tab21") {
      this.setState({selectedIdx: 1});
    } else if (props._dispatchInstances._currentElement.key === "tab10") {
      this.setState({selectedIdx: 0});
    }
  }

  render(){
    let tabArr = JSON.parse(this.props.options);
    return (
    <div className="TabContainer">
      <h1>Tabs</h1>
      <ul className="header-row">
        {tabArr.map((tab, idx) => <h1 onClick={this.updateTab} key={tab.title + idx}>{tab.title}</h1>)}
      </ul>
      <div className="ArticleContainer">
        <article>This is tab #{this.state.selectedIdx + 1}</article>
      </div>
    </div>
    );
  }
}

export default Tabs;
