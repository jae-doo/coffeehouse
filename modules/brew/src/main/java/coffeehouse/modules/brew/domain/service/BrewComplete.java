package coffeehouse.modules.brew.domain.service;

import coffeehouse.modules.order.domain.OrderId;

/**
 * @author springrunner.kr@gmail.com
 */
@FunctionalInterface
public interface BrewComplete {

    void complete(OrderId orderId);
}
