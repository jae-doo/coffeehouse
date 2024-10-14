package coffeehouse.libraries.message;

import java.util.Observable;

import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;

public class ObservableChannel extends Observable implements MessageChannel {

	@Override
	public boolean send(Message<?> message) {
		this.setChanged();
		this.notifyObservers(message);
		return MessageChannel.super.send(message);
	}

	@Override
	public boolean send(Message<?> message, long timeout) {
		return false;
	}
}
