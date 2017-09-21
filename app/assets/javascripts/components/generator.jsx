class Generator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: false,
      sentence: ''
    };
  };

  generateSentence() {
    var self = this;
    $.ajax({
      url: '/sentence_generators',
      type: "POST"
    }).done(function (response){
      self.setState({ sentence: response.sentence })
      return(response.sentence);
    });
  };

  render() {
    return(
      <div>
        <h3 className="h3">{this.state.sentence}</h3>
        <GenerateButton handleClick={this.generateSentence.bind(this)}
          text="Generate sentence!"/>
      </div>
    )
  };
}
