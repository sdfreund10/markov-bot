class TextSubmitter extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: '',
      isLoading: false
    };
  }

  handleChange(event) {
    this.setState({ value: event.target.value });
  }

  handleSubmit(event) {
    self = this;

    event.preventDefault();
    this.setState({ isLoading: true });
    $.ajax({
      url: '/sentence_processor',
      type: 'POST',
      data: { text: self.state.value, user: self.props.user }
    }).done(function() {
      self.setState({ isLoading: false })
    });

    this.resetTextArea();;
  }

  resetTextArea () {
    this.setState({value: ''});
  }

  render () {
    if (this.state.isLoading) {
      return <h1>Chewing your text...</h1>
    } else {
      return(
        <form  className="form-group" id='feeder'>
          <TextArea onChange={this.handleChange.bind(this)} text={this.state.value}
                    enabled={this.props.editable}/>
          <br/>
          <input className='btn btn-default' type='submit' value='Submit'
            onClick={this.handleSubmit.bind(this)}/>
          <button className='btn btn-default' type='clear' onClick={this.resetTextArea.bind(this)}>Clear</button>
        </form>
      )
    }
  }
}
