class MarkovFeeder extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      user: this.props.user
    };
  }

  changeUser (newUser) {
    this.setState({ user: newUser })
  }

  currentUser () {
    // check if the currently selected user is the same as the base user
    return (this.state.user === this.props.user)
  }

  render() {
    return(
      <div className='container-fluid'>
        <h3>
          Hi! I am the bot named Markov
          <br/>
          <small>I eat your sentences and learn to generate my own.</small>        
        </h3>
        <h4><small>Which user should I use to learn?</small></h4>
        <UserSelect me={this.props.user} callback={this.changeUser.bind(this)}/>
        <TextSubmitter user={this.state.user} editable={this.state.user === this.props.user}
          editable={this.currentUser()}/>
        <Generator user={this.state.user}/>
      </div>
    )
  }
}
