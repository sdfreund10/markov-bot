class Generator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: false,
      sentence: ''
    };
  }

  generateSentence () {
    this.setState({ isLoading: true });

    var sentence;

    $.ajax({
      url: '/sentence_generators',
      type: "POST",
      success: (response) => {
        this.setState({ sentence: response.sentence });
      }
    });
    console.log(this.state);
    this.setState({ isLoading: false });
  }

  render() {
    if (this.state.sentence.length === 0) {
      return <button className='btn btn-default' type='clear' onClick={this.generateSentence.bind(this)}>
        Generate sentence!
      </button>
    } else {
      return(
        <div>
          <button className='btn btn-default' type='clear' onClick={this.generateSentence.bind(this)}>
            Generate another!
          </button>
          <h3>{this.state.sentence}</h3>
        </div>
      )
    }
  }
}
