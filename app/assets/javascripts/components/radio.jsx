class Radio extends React.Component {

  render() {
    return(
      <label className='radio-inline'>
        <input type='radio' name='userSelect' onChange={this.props.onChange}
               checked={this.props.checked}/>
          {this.props.text}
      </label>
    )
  }
}
