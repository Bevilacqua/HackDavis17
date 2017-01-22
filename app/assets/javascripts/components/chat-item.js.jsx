var ChatItem = React.createClass({
	propTypes: {
	    title:						React.PropTypes.string, // Path to get the title of the item
		body: 					    React.PropTypes.string, // Path to the item body
	    updated_at: 			    React.PropTypes.any, // time stamp of update
	},

// WORKFLOW

  	componentDidMount: function() {
		this.mountProcess();
    },

    mountProcess: function() {
    },

// FETCH


// HANDLE


// STATE

	getInitialState() {
		return({
		});
	},

// RENDER

	render() {
        
       return(
           <p>{this.props.title} {this.props.body} {this.props.updated_at}</p>
       );
	}

});