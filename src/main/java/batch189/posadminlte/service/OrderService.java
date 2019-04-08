package batch189.posadminlte.service;

import java.util.Collection;

import batch189.posadminlte.model.Order;
import batch189.posadminlte.modelview.OrderModelView;

public interface OrderService {

	public Order findOne(String id);
	public Collection<Order> findAll();
	public Order update(Order order);
	public void delete(Order order);
	public void deleteById(String id);
	public void save(OrderModelView orderModelView);
}
