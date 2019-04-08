package batch189.posadminlte.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import batch189.posadminlte.model.Barang;
import batch189.posadminlte.service.BarangService;

@RestController
@RequestMapping("/barang")
public class BarangController {

	@Autowired
	private BarangService barangService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ResponseEntity<Collection<Barang>> findAll(@RequestParam(value = "nama", required = false ) String nama) {
		Collection<Barang> list = barangService.findAll();
		
		ResponseEntity<Collection<Barang>> result = new ResponseEntity<>(list, HttpStatus.OK);
		return result;
	}
	
	@RequestMapping(value = "/{kode}", method = RequestMethod.GET)
	public ResponseEntity<Barang> findOne(@PathVariable("kode") String kode) {
	    Barang barang = barangService.findOne(kode);
		
		ResponseEntity<Barang> result = new ResponseEntity<>(barang, HttpStatus.OK);
		return result;
	}

	@RequestMapping(value = "/search/", method = RequestMethod.GET)
	public ResponseEntity<Collection<Barang>> searchByNama(@RequestParam(value = "nama") String nama) {
		Collection<Barang> list = barangService.searchByNama(nama);
		
		ResponseEntity<Collection<Barang>> result = new ResponseEntity<>(list, HttpStatus.OK);
		return result;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<Barang> save(@RequestBody Barang barang) {
		barangService.save(barang);
		
		ResponseEntity<Barang> result = new ResponseEntity<>(HttpStatus.OK);
		return result;
	}
	
	
	@RequestMapping(value = "/{kode}", method = RequestMethod.DELETE)
	public ResponseEntity<Barang> deleteById(@PathVariable("kode") String kode) {
        barangService.deleteById(kode);
		
		ResponseEntity<Barang> result = new ResponseEntity<>(HttpStatus.OK);
		return result;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public ResponseEntity<Barang> update(@RequestBody Barang barang) {
		barangService.update(barang);
		
		ResponseEntity<Barang> result = new ResponseEntity<>(HttpStatus.OK);
		return result;
		
	}
}
