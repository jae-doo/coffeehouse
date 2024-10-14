package coffeehouse.modules.order.data.message;

import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Component;

import coffeehouse.modules.order.domain.OrderId;
import coffeehouse.modules.order.domain.message.BrewRequestCommand;
import coffeehouse.modules.order.domain.service.BarCounter;

@Component
public class BrewRequestProducer implements BarCounter {

	private final MessageChannel barCounterChannel;

	public BrewRequestProducer(MessageChannel barCounterChannel) {
		this.barCounterChannel = barCounterChannel;
	}

	@Override
	public void brew(OrderId orderId) {
		var command = new BrewRequestCommand(orderId);

		// Generic
		var message = new GenericMessage<BrewRequestCommand>(command);

		// MessageBuilder

		barCounterChannel.send(message);
	}
}
