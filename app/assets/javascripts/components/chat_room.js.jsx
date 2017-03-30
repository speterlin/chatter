class ChatRoomList extends React.Component {
  constructor (props) {
    super(props);
  }

  render () {
    const chat_room_link = "/chat_rooms/" + this.props.chat_room.id;

    return (
      <li>
        <div className="chat-room"><a href={chat_room_link} >{this.props.chat_room.title}</a>
          <ChatRoomDescription description={this.props.chat_room.description} />
          <ChatRoomImage image={this.props.chat_room.image} />
          <DeleteChatRoom id={this.props.chat_room.id} />
        </div>
      </li>
    );
  }
};

class ChatRoomDescription extends React.Component {
  render () {
    return (
      <div className="chat-room-description">
        {this.props.description}
      </div>
    )
  }
}

class ChatRoomImage extends React.Component {

  render () {

    return (
      <div className="chat-room-img">
        <img src={this.props.image.small_thumb.url} />
      </div>
    )
  }
}


class DeleteChatRoom extends React.Component {

  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    console.log(this.props.id);
    $.ajax({
      type: 'DELETE',
      url: '/chat_rooms/' + this.props.id,
      async: false,
      success: function(data) { console.log(data) },
      error: function(response) { console.log("Error "+response); }
    })
  }

  render () {
    return (
      <input
        type="submit"
        className="btn"
        ref="delete"
        value="Delete"
        onClick={this.handleSubmit}
      />
    )
  }

}

class ChatRoomForm extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {

    const token = $('meta[name="csrf-token"]').attr('content');

    return (
      <form encType="multipart/form-data" action="/chat_rooms" method="POST" data-remote="true">
        <input
          type="hidden"
          name="authenticity_token"
          value={token}
        />
        <input
          type="text"
          className="chat-room-title"
          name="chat_room[title]"
          placeholder="chat room title"
          ref="title"
        />
        <input
          type="text"
          className="chat-room-recipient-id"
          name="chat_room[recipient_id]"
          placeholder="chat room recipient id"
          ref="recipient_id"
        />
        <input
          type="file"
          className="chat-room-image"
          name="chat_room[image]"
          ref="image"
        />
        <input
          type="submit"
          className="btn"
          ref="button"
          value="Submit"
        />
      </form>
    )
  }
}

ChatRoomList.propTypes = {
  chat_room: React.PropTypes.object.isRequired
};
