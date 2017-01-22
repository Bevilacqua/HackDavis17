var ChatUsers = React.createClass({
	propTypes: {
	    user_path:						React.PropTypes.string, // Path to get the group messages JSON
        group_id:                       React.PropTypes.number, // ID of group
	},

// WORKFLOW

  	componentDidMount: function() {
		this.mountProcess();
    },

    mountProcess: function() {
		this.fetchUsers();
        setInterval(this.fetchUsers, 500);
    },

    componentWillUnmount: function() {
        clearInterval(this.setPolling);
    },


// FETCH

	fetchUsers: function() {
		$.getJSON(
			this.props.user_path + ".json",
            {
                group_path: this.props.group_id,
            },
			(data) => this.setState({users: data})
		)
		.done(function() {
		}.bind(this));
	},


// HANDLE


// STATE

	getInitialState() {
		return({
			setPolling: 	'',
			users: 			[],
		});
	},

// RENDER

	render() {
        
        if(!this.state.users || this.state.users == undefined) {
            return (
                <div className="tags" >
                    <p>loading</p>
                </div>
            );
            
        }
        
        var createTag = (user) => (
            <li><p className="tag" >{user.first_name} {user.last_name}</p></li>
        );
        return (
            <div className="tags" >
                {this.state.users.map(createTag)}
            </div>
		  );
	}

});