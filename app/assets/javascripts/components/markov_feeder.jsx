class MarkovFeeder extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: ''
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ value: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    $.ajax({
      url: '/sentence_processor',
      type: 'POST',
      data: { text: this.state.value }
    });

    this.setState({ value: "" })
  }

  render() {
    return(
      <form id='feeder' onSubmit={this.handleSubmit}>
        <textarea value={this.state.value} onChange={this.handleChange}
          form='feeder' placeholder="Feed me text!" cols="100" rows="20"/>
        <br/>
        <input className='btn btn-default' type='submit' value='Submit' />
        <button className='btn btn-default' type='clear'>Clear</button>
      </form>
    )
  }
}
