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
      data: { text: self.state.value }
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
          <textarea value={this.state.value} onChange={this.handleChange.bind(this)}
            form='feeder' placeholder="Feed me text!" cols="100" rows="20"/>
          <br/>
          <input className='btn btn-default' type='submit' value='Submit'
            onClick={this.handleSubmit.bind(this)}/>
          <button className='btn btn-default' type='clear' onClick={this.resetTextArea.bind(this)}>Clear</button>
        </form>
      )
    }
  }
}
