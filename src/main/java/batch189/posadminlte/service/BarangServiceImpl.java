package batch189.posadminlte.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import batch189.posadminlte.dao.BarangDao;
import batch189.posadminlte.model.Barang;

@Service
@Transactional
public class BarangServiceImpl implements BarangService {

	@Autowired
	private BarangDao barangDao;
	
	@Override
	public Barang findOne(String id) {
		return barangDao.findOne(id);
	}

	@Override
	public Collection<Barang> findAll() {
		return barangDao.findAll(); 
	}

	@Override
	public Barang update(Barang barang) {
		return barangDao.update(barang);
	}

	@Override
	public void delete(Barang barang) {
		barangDao.delete(barang);
	}

	@Override
	public void deleteById(String id) {
		barangDao.deleteById(id);
	}

	@Override
	public void save(Barang barang) {
		barangDao.save(barang);
	}

	@Override
	public Collection<Barang> searchByNama(String nama) {
		return barangDao.searchByNama(nama);
	}

}
