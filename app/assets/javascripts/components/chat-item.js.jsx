var ChatItem = React.createClass({
	propTypes: {
	    title:						React.PropTypes.string, // Path to get the title of the item
		body: 					    React.PropTypes.string, // Path to the item body
	    updated_at: 			    React.PropTypes.any, // time stamp of update
      image_url:        React.PropTypes.string, // Path to image
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
        var item_img = (
          this.props.image_url ?
            <img src={this.props.image_url} />
          :
            <span></span>
        );
       return(
         <div className="chatMessage">
           <h6><strong>{this.props.title} </strong>
              <small className="time">{this.props.updated_at}</small>
           </h6>
           <p>{this.props.body}</p>
           {item_img}
         </div>

       );
	}

});
