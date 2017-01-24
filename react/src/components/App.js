import React, { Component } from 'react';
import Monster from './Monster';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      monsters: []
    };
  }

  componentDidMount() {
    $.ajax({
        method: "GET",
        url: "/monsters.json",
      })
      .done(data => {
        this.setState({
          monsters: data.reverse()
        });
      });
  }

  render() {
    let recentMonsters = this.state.monsters.slice(0, 3).map(monster => {
      return(
        <Monster
          key={monster.id}
          id={monster.id}
          name={monster.name}
          source={monster.source}
          img={monster.img}
          description={monster.description}
         />
      )

    })
    return(
      <div>
        <h4>Monsters Added This Week</h4>
        {recentMonsters}
      </div>
      )
    }
}

export default App;
