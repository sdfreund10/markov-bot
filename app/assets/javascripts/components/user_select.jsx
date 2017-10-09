class UserSelect extends React.Component {

  setUser (userToken) {
    this.props.callback(userToken);
  }

  render() {
    return(
      <form>
        <label className='radio-inline'>
          <input type='radio' name='userSelect' onClick={this.setUser.bind(this, this.props.me)}
                 value='me' checked={this.state.selectedOption === 'me'}/>
          Me
        </label>
        <label className='radio-inline'>
          <input type='radio' name='userSelect'onClick={this.setUser.bind(this, 'KanyeWest')}
                 value='Kanye' checked={this.state.selectedOption === 'Kanye'}/>
          Kanye
        </label>
        <label className='radio-inline'>
          <input type='radio' name='userSelect' onClick={this.setUser.bind(this, 'JRTolkien')}
                 value='J.R.' checked={this.state.selectedOption === 'J.R.'}/>
          J.R.
        </label>
        <label className='radio-inline'>
          <input type='radio' name='userSelect' onClick={this.setUser.bind(this, 'JadenSmith')}
                 value='Jaden' checked={this.state.selectedOption === 'Jaden'}/>
          Jaden
        </label>
      </form>
    )
  }
}
