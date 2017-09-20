class GenerateButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      text: props.text
    };
  }

  render () {
    return(
      <button className='btn btn-default' type='clear' onClick={this.props.handleClick}>
        {this.state.text}
      </button>
    );
  }
}