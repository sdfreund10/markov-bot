class UserSelect extends React.Component {

  setUser (userToken) {
    this.props.callback(userToken);
  }

  render() {
    return(
      <form>
        <label className='radio-inline'>
          <input type='radio' name='userSelect' onChange={this.setUser.bind(this, this.props.me)}
                 value='me' checked={this.props.user === this.props.me}/>
          Me
        </label>
        <label className='radio-inline'>
          <input type='radio' name='userSelect'onChange={this.setUser.bind(this, 'KanyeWest')}
                 value='Kanye' checked={this.props.user === 'KanyeWest'}/>
          Kanye
        </label>
        <label className='radio-inline'>
          <input type='radio' name='userSelect' onChange={this.setUser.bind(this, 'JRRTOLKIEN')}
                 value='J.R.' checked={this.props.user === 'JRRTOLKIEN'}/>
          J.R.R.
        </label>
      </form>
    )
  }
}
