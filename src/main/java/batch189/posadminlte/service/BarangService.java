package batch189.posadminlte.service;

import java.util.Collection;

import batch189.posadminlte.model.Barang;

public interface BarangService {

	public Barang findOne(String id);
	public Collection<Barang> findAll();
	public Barang update(Barang barang);
	public void delete(Barang barang);
	public void deleteById(String id);
	public void save(Barang barang);
	public Collection<Barang> searchByNama(String nama);
}
