var ChatRoom = React.createClass({
	propTypes: {
	    group_path:						React.PropTypes.string, // Path to get the group messages JSON
		items_path: 					React.PropTypes.string, // Path to message creation
	    group_id: 						React.PropTypes.number, // ID number of current group
	    user: 							React.PropTypes.any, 	// User
	},

// WORKFLOW

  	componentDidMount: function() {
		this.mountProcess();
    },

    mountProcess: function() {
		this.fetchItems();
		this.setPolling = setInterval(this.fetchGroup, 10000);
    },

    componentWillUnmount: function() {
    	clearInterval(this.setPolling);
    },


// FETCH

	fetchItems: function() {
		$.getJSON(
			this.props.items_path + "/" + this.props.group_id + ".json",
			(data) => this.setState({items: data})
		)
		.done(function() {

		}.bind(this));
	},


// HANDLE



// STATE

	getInitialState() {
		return({
			setPolling: 	'',
			items: 			[],
		});
	},

// RENDER

	render() {

		return (
			<h4>REACT COMPONENT</h4>
		);
	}

});