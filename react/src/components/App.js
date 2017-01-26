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
        url: "/monsters/home.json",
      })
      .done(data => {
        this.setState({
          monsters: data.reverse()
        });
      });
  }

  // componentDidMount() {
  //   tick() {
  //     $.ajax({
  //         type: "GET",
  //         url: "/monsters/home.json",
  //         dataType: "JSON",
  //         success:function(data){
  //           this.setState({monsters: data});
  //
  //           this.timer = setTimeout(tick, 500);
  //         }.bind(this)
  //     });
  //   };
  //   tick();
  // },
  // componentWillUnmount: function() {
  //   clearTimeout(this.timer);
  // }


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
      <div className="row text-center" id="recently-added-monsters">
        <h2>Recently Added Monsters</h2>
        {recentMonsters}
      </div>
      )
    }
}

export default App;
