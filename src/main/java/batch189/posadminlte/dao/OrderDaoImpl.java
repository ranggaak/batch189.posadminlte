package batch189.posadminlte.dao;


import org.springframework.stereotype.Repository;

import batch189.posadminlte.model.Order;

@Repository
public class OrderDaoImpl extends AbstractHibernateDao<Order> implements OrderDao {

	public OrderDaoImpl () {
		setClazz(Order.class);
	}

}
