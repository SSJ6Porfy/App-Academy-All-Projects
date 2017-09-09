import React from "react";

class AutoComplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {inputVal: ''};
    this.setInput = this.setInput.bind(this);
    this.AutoCompleteClick = this.AutoCompleteClick.bind(this);
  }

  setInput(e) {
    const inputVal = e.target.value;
    this.setState({inputVal});
  }

  AutoCompleteClick(e) {
    if(e.target.tagName === "LI") {
      this.setState({inputVal: e.target.innerText});
    }
  }

  render() {
    const { inputVal } = this.state;
    const filteredNames = this.props.names.split(" ").filter(name => name.includes(inputVal));
    return (
      <div>
        <h1>AutoComplete</h1>
        <div className="AutoCompleteContainer">
          <input onChange={this.setInput} value={inputVal}></input>
          <ul onClick={this.AutoCompleteClick}>
            {filteredNames.map((name,idx) => <li key={name + idx}>{name}</li> ) }</ul>
        </div>
      </div>
    );
  }
}

export default AutoComplete;
