<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="assets/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="assets/css/dataTables.bootstrap.min.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="assets/css/bootstrap-datepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="assets/css/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="assets/css/AdminLTE.min.css">
  <!-- AdminLTE Skins -->
  <link rel="stylesheet" href="assets/css/skin-blue.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

      <!-- Logo -->
      <a href="index2.html" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>S</b>P</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Spring</b>POS</span>
      </a>

      <!-- Header Navbar -->
      <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
          <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <!-- User Account Menu -->
            <li class="dropdown user user-menu">
              <!-- Menu Toggle Button -->
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <!-- The user image in the navbar-->
                <img src="assets/img/photo2.png" class="user-image" alt="User Image">
                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                <span class="hidden-xs">Alexander Pierce</span>
              </a>
              <ul class="dropdown-menu">
                <!-- The user image in the menu -->
                <li class="user-header">
                  <img src="assets/img/photo2.png" class="img-circle" alt="User Image">

                  <p>
                    Alexander Pierce
                    <small>Member since Nov. 2012</small>
                  </p>
                </li>
                <!-- Menu Footer-->
                <li class="user-footer">
                  <div class="pull-left">
                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                  </div>
                  <div class="pull-right">
                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                  </div>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree">
          <li class="header">MENU</li>
          <li class="active"><a href="order"><i class="fa fa-shopping-cart"></i> <span>Data Order</span></a></li>
          <li><a href="barang"><i class="fa fa-tags"></i> <span>Data Barang</span></a></li>
        </ul>
        <!-- /.sidebar-menu -->
      </section>
      <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Data Order
          <small>Halaman data order</small>
        </h1>
      </section>

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
                    <div class="col-md-3">
                      <div class="form-group">
                        <label>Cari Barang</label>
                        <div class="input-group">
                          <input type="text" class="form-control" name="search" id="search" placeholder="Search">
                          <div class="input-group-btn">
                            <button type="button" class="btn btn-default" onclick="loadData()">
                              <i class="fa fa-search"></i>
                            </button>
                            <button type="button" class="btn btn-default" onclick="loadData('reset')">
                              <i class="fa fa-close"></i>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
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
                  </div>

                </div>

                <div class="box-footer">
                  <button type="button" class="btn btn-primary" onclick="tambahOrderDetail()">
                    Tambah Barang
                  </button>
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
                      <th>Action</th>
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

      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- ./wrapper -->

  <!-- REQUIRED JS SCRIPTS -->

  <!-- jQuery 3 -->
  <script src="assets/js/jquery.min.js"></script>
  <!-- Bootstrap 3.3.7 -->
  <script src="assets/js/bootstrap.min.js"></script>
  <!-- Select2 -->
  <script src="assets/js/select2.full.min.js"></script>
  <!-- DataTables -->
  <script src="assets/js/jquery.dataTables.min.js"></script>
  <script src="assets/js/dataTables.bootstrap.min.js"></script>
  <!-- bootstrap datepicker -->
  <script src="assets/js/bootstrap-datepicker.min.js"></script>
  <!-- AdminLTE App -->
  <script src="assets/js/adminlte.min.js"></script>
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

    function loadData(reset) {
      if (reset) {
        $('#search').val('');
      }
      var search = $('#search').val();
      var url = '';
      if (search == '') {
        url = 'barang/'
      } else {
        url = 'barang/search/?nama=' + search
      }
      $.ajax({
        type: 'get',
        url: url,
        success: function (d) {
          tampilkanData(d);
        },
        error: function (d) {
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

    // document.ready

    $(document).ready(function () {
      $('#tglTransaksi').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
      });
      loadData();
    });

  </script>
</body>

</html>