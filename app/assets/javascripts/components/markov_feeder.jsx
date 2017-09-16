class MarkovFeeder extends React.Component {
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
    event.preventDefault();
    this.setState({ isLoading: true });
    $.ajax({
      url: '/sentence_processor',
      type: 'POST',
      data: { text: this.state.value }
    }).done(
      this.setState({ isLoading: false })
    );

    this.setState({ value: "" });
  }

  render() {
    if (this.isLoading) {
      return <div>Chewing your message...</div>
    } else {
      return(
        <form id='feeder' onSubmit={this.handleSubmit.bind(this)}>
          <textarea value={this.state.value} onChange={this.handleChange.bind(this)}
            form='feeder' placeholder="Feed me text!" cols="100" rows="20"/>
          <br/>
          <input className='btn btn-default' type='submit' value='Submit' />
          <button className='btn btn-default' type='clear'>Clear</button>
        </form>
      )
    }
  }
}
