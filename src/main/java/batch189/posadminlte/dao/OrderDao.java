package batch189.posadminlte.dao;

import java.util.Collection;

import batch189.posadminlte.model.Order;

public interface OrderDao {

	public Order findOne(String id);
	public Collection<Order> findAll();
	public Order update(Order order);
	public void delete(Order order);
	public void deleteById(String id);
	public void save(Order order);
	
}
