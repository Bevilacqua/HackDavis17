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
        setInterval(this.fetchItems, 500);
    },

    componentWillUnmount: function() {
        clearInterval(this.setPolling);
    },


// FETCH

	fetchItems: function() {
		$.getJSON(
			this.props.items_path + ".json",
            {
                group_path: this.props.group_id,
            },
			(data) => this.setState({items: data})
		)
		.done(function() {
		}.bind(this));
	},


// HANDLE

    handleMessageChange: function(event) {
        this.setState({message_val: event.target.value})
    },

    handleKeyPress: function(event){
        if (event.key === 'Enter') {
            event.preventDefault(); //when enter is clicked doesn't reoload page
        $.post(
            this.props.items_path + ".json",
            {
                title: this.props.user.first_name + " " + this.props.user.last_name,
                body: this.state.message_val,
                group_id: this.props.group_id
            }
        )
        .done(function() {
            this.setState({message_val: ""});
            this.fetchItems();
        } .bind(this));
        }
    },

    handleSend: function(event) {
        event.preventDefault(); //when enter is clicked doesn't reoload page
        $.post(
            this.props.items_path + ".json",
            {
                title: this.props.user.first_name + " " + this.props.user.last_name,
                body: this.state.message_val,
                group_id: this.props.group_id
            }
        )
        .done(function() {
            this.setState({message_val: ""});
            this.fetchItems();
        } .bind(this));
    },

// STATE

	getInitialState() {
		return({
			setPolling: 	'',
			items: 			[],
            message_val:    "",
		});
	},

// RENDER

	render() {

        if(!this.state.items || this.state.items == undefined) {
            return (
                <div id="chatRoom" >
                    <p>loading</p>
                </div>
            );

        }

        var createItem = (item) => (
                <ChatItem title={item.title} body={item.body} updated_at={item.updated_at} key={item.id} />
            );
        return (
            <div id="chatRoom" >
                <div className="chat-box">
                {this.state.items.map(createItem)}
                </div>
                <div id="messageBar">
                    <input type="text" className="form-control" id="message_bar_input" placeholder="Hello World" onChange={this.handleMessageChange} value={this.state.message_val} onKeyPress={this.handleKeyPress}></input>
                    <button className="btn btn-primary" id="message_bar_button" onClick={this.handleSend}>Send</button>
                </div>
            </div>
		  );
	}

});
