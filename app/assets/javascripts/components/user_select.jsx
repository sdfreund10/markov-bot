class UserSelect extends React.Component {

  setUser (userToken) {
    this.props.callback(userToken);
  }

  render() {
    return(
      <form>
        <Radio text='Me' checked={this.props.user === this.props.me}
               onChange={this.setUser.bind(this, this.props.me)}/>
        <Radio text='J.R.R.' checked={this.props.user === 'JRRTOLKIEN'}
               onChange={this.setUser.bind(this, 'JRRTOLKIEN')}/>
        <Radio text='Kanye' checked={this.props.user === 'KanyeWest'}
               onChange={this.setUser.bind(this, 'KanyeWest')}/>
      </form>
    )
  }
}
