package batch189.posadminlte.dao;


import org.springframework.stereotype.Repository;

import batch189.posadminlte.model.OrderDetail;

@Repository
public class OrderDetailDaoImpl extends AbstractHibernateDao<OrderDetail> implements OrderDetailDao {

	public OrderDetailDaoImpl () {
		setClazz(OrderDetail.class);
	}

}
