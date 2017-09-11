import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      text: "█"
    }
  }

  render () {

    if (this.props.bombed) {
      this.setState(text: "☢")
    }
    if (this.props.flagged) {
      this.setState(text: "⚑")
    }

    return <div className="tile">{this.state.text}</div>
  }
}

export default Tile;
