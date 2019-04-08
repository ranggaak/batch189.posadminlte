package batch189.posadminlte.dao;


import java.util.Collection;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import batch189.posadminlte.model.Barang;

@Repository
public class BarangDaoImpl extends AbstractHibernateDao<Barang> implements BarangDao {

	public BarangDaoImpl () {
		setClazz(Barang.class);
	}

	public Collection<Barang> searchByNama(final String nama) {
		String hql = "FROM Barang B WHERE LOWER(B.nama) LIKE LOWER(:nama)";
		Query q = getCurrentSession().createQuery(hql);
		q.setParameter("nama", "%" + nama + "%");

		Collection<Barang> result = q.list();
		return result;
	}
	
}
