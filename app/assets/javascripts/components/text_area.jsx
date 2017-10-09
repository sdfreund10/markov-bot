class TextArea extends React.Component {
  render() {
    if (this.props.enabled){
      return(<textarea value={this.props.text} onChange={this.props.onChange}
              form='feeder' placeholder="Feed me text!" cols="100" rows="20"/>)
    } else {
      return(<textarea disabled className='disabled' form='feeder' cols="100" rows="20"
                placeholder="You can't sumbit text as someone else" value = ''/>)
    }
  }
}