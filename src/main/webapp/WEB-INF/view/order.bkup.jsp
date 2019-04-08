<!doctype html>
<html lang="en">
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<title>Form Barang</title>
</head>

<body class="bg-light">
    <div class="container">


        <div class="row">
            <div class="col-md-12">
                <h4 class="mb-3 mt-3">Form Order</h4>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <form id="form-order">
                <div class="mb-3">
                    <label>Kode Transaksi</label>
                    <input type="text" class="form-control" id="kode" name="kode">
                </div>
            </div>
            <div class="col-md-4">
                <div class="mb-3">
                    <label>Nama Pelanggan</label>
                    <input type="text" class="form-control" id="namaPelanggan" name="namaPelanggan">
                </div>
            </div>
            <div class="col-md-4">
                <div class="mb-3">
                    <label>Tanggal Transaksi</label>
                    <input type="date" class="form-control" id="tglTransaksi" name="tglTransaksi">
                </div>
            </div>
            <hr class="mb-4">
        </div>

        <div class="row">
            <div class="col-md-8">
                <div class="mb-3">
                    <label>Barang</label>
                    <select class="custom-select d-block w-100" id="barang" name="barang">
                    </select>
                </div>
            </div>
            <div class="col-md-2">
                <div class="mb-3">
                    <label>Jumlah Barang</label>
                    <input type="number" class="form-control" id="jumlahBarang" name="jumlahBarang" value="1">
                </div>
            </div>
            <div class="col-md-2">
                <div class="mb-3">
                    <label>&nbsp;</label><br>
                    <input class="btn btn-primary" type="button" value="Tambah" onclick="tambahOrderDetail()">
                </div>
            </div>
            <hr class="mb-4">
        </div>

        <div class="row">
            <div class="col-md-12">
            	<h4 class="mb-3 mt-3">Order Detail</h4>
				<div class="table-responsive">
				  <table class="table table-striped table-sm">
				    <thead>
				      <tr>
				        <th>Kode Barang</th>
				        <th>Nama Barang</th>
				        <th>Harga Satuan</th>
				        <th>Jumlah Barang</th>
				        <th>Subtotal (Rp)</th>
				      </tr>
				    </thead>
				    <tbody id="data-order-detail">
				    </tbody>
				  </table>
				</div>    
            </div>
        </div>

        <div class="row">
            <div class="col-md-8">
                <label>&nbsp;</label><br>
                <input class="btn btn-primary" type="button" value="Submit" onclick="simpanOrder()">
            </div>
            <div class="col-md-4">
                <label>Grand Total (Rp)</label>
                <input type="text" class="form-control" id="grandTotal" name="grandTotal" readonly>
            </div>
            </form>
        </div>


    </div>
	<script>

        // fungsi utk membuat detailOrder yg akan disubmit 

        var orderDetails = [];

        function tambahOrderDetail() {
            var elementBaru = true;

            $.each(orderDetails, function(index, element) {
                if (element.id.kodeBarang == $('#barang').val()) {
                    element.jumlahBarang = Number(element.jumlahBarang) + Number($('#jumlahBarang').val());
                    elementBaru = false;
                }
            });

            if (elementBaru) {
                var orderDetail = {};
                orderDetail.id  = {};
                orderDetail.id.kodeOrder  = '';
                orderDetail.id.kodeBarang = $('#barang').val();
                orderDetail.hargaSatuan   = $('#barang > option:selected').data('harga');
                orderDetail.jumlahBarang  = $('#jumlahBarang').val();
                orderDetail.h_namaBarang  = $('#barang > option:selected').data('nama');
                // tanpa subtotal
                
                orderDetails.push(orderDetail);
            }

            refreshDaftarBarang();
        }

        // fungsi utk input detailOrder ke object order & kirim data order

        var order = {};

        function simpanOrder() {
            $.each(orderDetails, function(index, element){
                element.id.kodeOrder  = $('#kode').val();
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
                success: function(d) {
                    order = {};
                    orderDetails = [];
                    refreshDaftarBarang();
                    $('#kode, #namaPelanggan, #tglTransaksi').val('');
                    $('#jumlahBarang').val('1');
                },
                error: function(d) {
					console.log('Error - simpan');
                }
            });
        }

        // fungsi utk refresh daftar barang & nilai grand total

        function refreshDaftarBarang() {
            var subTotal = 0;
            var grandTotal = 0;
            var s = '<tr>';

            $.each(orderDetails, function(index, element) {
                subTotal = element.hargaSatuan * element.jumlahBarang;
                s += '<td>' + element.id.kodeBarang + '</td>';
                s += '<td>' + element.h_namaBarang + '</td>';
                s += '<td>' + element.hargaSatuan + '</td>';
                s += '<td>' + element.jumlahBarang + '</td>';
                s += '<td>Rp' + subTotal + '</td>';
                s += '</tr>';
                grandTotal += subTotal;
            });

            $('#data-order-detail').html(s);
            $('#grandTotal').val(grandTotal);
        }	

        // fungsi awal utk load data dropdown

        function loadData() {
            $.ajax({
                type: 'GET',
                url: 'barang/',
                success: function(d) {
                    tampilkanData(d);
                },
                error: function(d) {
					console.log('Error - loadData');
                }
            });
        }

        function tampilkanData(d) {
			var s = '';
			$(d).each(function(index, element) {
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

        // document.ready

        $(document).ready(function() {
            loadData();
        });

	</script>
</body>

</html>
