class Generator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: false,
      sentence: '',
      loading: false
    };
  };

  generateSentence() {
    var self = this;

    this.setState({ loading: true })

    $.ajax({
      url: '/sentence_generators',
      type: "POST",
      data: { user: this.props.user }
    }).done(function (response){
      self.setState({ sentence: response.sentence, loading: false });
    });
  };

  whatText() {
    if (this.state.loading) {
      return("Hmm.....")
    } else {
      return(this.state.sentence)
    }
  }

  render() {
    return(
      <div>

        <h3 className="h3">{this.whatText()}</h3>
        <GenerateButton handleClick={this.generateSentence.bind(this)}
          text="Generate sentence!"/>
      </div>
    )
  };
}
