<!DOCTYPE html>
<html>

<head>
  <title>POS | Order</title>
<script>
    // membuat detailOrder yg akan disubmit 
    var orderDetails = [];
    function tambahOrderDetail() {
      var orderDetailBaru = true;
      $.each(orderDetails, function (index, element) {
        if (element.id.kodeBarang == $('#barang').val()) {
          element.jumlahBarang = Number(element.jumlahBarang) + Number($('#jumlahBarang').val());
          orderDetailBaru = false;
        }
      });
      if (orderDetailBaru) {
        var orderDetail = {};
        orderDetail.id = {};
        orderDetail.id.kodeOrder = '';
        orderDetail.id.kodeBarang = $('#barang').val();
        orderDetail.jumlahBarang = $('#jumlahBarang').val();
        orderDetail.hargaSatuan = $('#barang > option:selected').data('harga');
        orderDetail.h_namaBarang = $('#barang > option:selected').data('nama');
        // tanpa subtotal
        orderDetails.push(orderDetail);
      }
      refreshDaftarBarang();
    }
    // input detailOrder ke object order & kirim data order
    var order = {};
    function simpanOrder() {
      $.each(orderDetails, function (index, element) {
        element.id.kodeOrder = $('#kode').val();
      });
      order.kode = $('#kode').val();
      order.namaPelanggan = $('#namaPelanggan').val();
      order.tglTransaksi = $('#tglTransaksi').val();
      order.orderDetails = orderDetails;
      // tanpa grandtotal
      $.ajax({
        type: 'POST',
        url: 'order/',
        data: JSON.stringify(order),
        contentType: 'application/json',
        success: function (d) {
          order = {};
          orderDetails = [];
          refreshDaftarBarang();
          $('#kode, #namaPelanggan, #tglTransaksi').val('');
          $('#jumlahBarang').val('1');
        },
        error: function (d) {
          console.log('Error - simpan');
        }
      });
    }
    // refresh daftar barang & nilai grand total
    function refreshDaftarBarang() {
      var subTotal = 0;
      var grandTotal = 0;
      var s = '<tr>';
      $.each(orderDetails, function (index, element) {
        subTotal = element.hargaSatuan * element.jumlahBarang;
        s += '<td>' + element.id.kodeBarang + '</td>';
        s += '<td>' + element.h_namaBarang + '</td>';
        s += '<td>' + element.hargaSatuan + '</td>';
        s += '<td>' + element.jumlahBarang + '</td>';
        s += '<td>Rp' + subTotal + '</td>';
        s += '</tr>';
        grandTotal += subTotal;
      });
      $('#tabelOrderDetail').html(s);
      $('#grandTotal').val(grandTotal);
      $('#jumlahBarang').val('1');
    }
    // fungsi utk load & tampilkan data dropdown
    var dataBarang = [];
    function loadData() {
      $.ajax({
        type: 'GET',
        url: 'barang/',
        success: function(d) {
          tampilkanData(d);
        },
        error: function(d) {
          console.log('Error');
        }
      });
    }
    function tampilkanData(d) {
      var s = '';
      $(d).each(function (index, element) {
        s += '<option value="' + element.kode
          + '" data-nama="' + element.nama
          + '" data-harga="' + element.harga + '">'
          + element.kode + ' - '
          + element.nama + ' - Rp'
          + element.harga
          + '</option>';
      });
      $('#barang').html(s);
    }
	
    //fungsi load data order
    var tabelOrder;
    function loadDataOrder() {
      $.ajax({
        type: 'get',
        url: 'order/',
        success: function (d) {
          tampilkanDataOrder(d);
        },
        error: function (d) {
          console.log('Error');
        }
      });
    }
    function tampilkanDataOrder(d) {
      tabelOrder.clear().draw();
      $(d).each(function (index, element) {
        tabelOrder.row.add([
          element.kode,
          element.namaPelanggan,
          element.tglTransaksi,
          element.grandTotal
        ]).draw();
      })
    }
    // document.ready
    $(document).ready(function () {
      loadDataOrder();
      tabelOrder = $('#tabelOrder').DataTable();
      $('#tglTransaksi').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
      });
      loadData();
    });
  </script>  
</head>

<body>
     
      <!-- Main content -->
      <section class="content">

        <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <form id="form-order">
                <div class="box-body">

                  <div class="row">
                    <div class="col-md-3">
                      <div class="form-group">
                        <label>Kode Transaksi</label>
                        <input type="text" class="form-control" name="kode" id="kode">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Nama Pelanggan</label>
                        <input type="text" class="form-control" name="namaPelanggan" id="namaPelanggan">
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="form-group">
                        <label>Tanggal Transaksi</label>
                        <div class="input-group date">
                          <div class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                          </div>
                          <input type="text" class="form-control" name="tglTransaksi" id="tglTransaksi">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Barang</label>
                        <select class="form-control" name="barang" id="barang"></select>
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="form-group">
                        <label>Jumlah barang</label>
                        <input type="number" class="form-control" name="jumlahBarang" id="jumlahBarang" value="1">
                      </div>
                    </div>
                 	<div class="col-md-2">
                 		<div class="form-group">
                		 <label>&nbsp;</label><br>
                  			<button type="button" class="btn btn-primary" onclick="tambahOrderDetail()">
                   			 Tambah Barang
                  			</button>
                 		</div>
                	</div>
                    <div class="col-md-1">
                 		<div class="form-group"></div></div>
                  	</div>

                </div>


              </form>
            </div>
          </div>
        </div>



        <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title">Tabel Order Detail</h3>
              </div>
              <div class="box-body">
                <table class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th>Kode Barang</th>
                      <th>Nama Barang</th>
                      <th>Harga Satuan</th>
                      <th>Jumlah Barang</th>
                      <th>Subtotal</th>
                    </tr>
                  </thead>
                  <tbody id="tabelOrderDetail"></tbody>
                </table>
              </div>
              <div class="box-footer">
                <div class="row" style="display: flex; align-items: flex-end;">
                  <div class="col-xs-8">
                    <button type="button" class="btn btn-primary" onclick="simpanOrder()">
                      Submit Order
                    </button>
                  </div>
                  <div class="col-xs-4">
                    <label>Grand Total</label>
                    <div class="input-group">
                      <span class="input-group-addon">Rp</span>
                      <input type="number" class="form-control" name="grandTotal" id="grandTotal" readonly>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
	<div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Tabel Order</h3>
        </div>
        <div class="box-body">
          <table id="tabelOrder" class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>Kode Transaksi</th>
                <th>Nama Pelanggan</th>
                <th>Tanggal Transaksi</th>
                <th>Grand Total</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- ./wrapper -->

  
</body>

</html>