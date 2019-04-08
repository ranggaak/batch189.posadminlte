<!DOCTYPE html>
<html>

<head>
<title>POS | Data Barang</title>
  <script>
    var modeSubmit = 'insert';
    var tabelBarang;

    function getFormData($form) {
      var unindexed_array = $form.serializeArray();
      var indexed_array = {};
      $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
      });
      return indexed_array;
    }

    function loadData() {
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
      tabelBarang.clear().draw();
      $(d).each(function (index, element) {
        tabelBarang.row.add([
          element.kode,
          element.nama,
          element.harga,
          element.satuan,
          '<input class="btn btn-default btn-sm" type="button" value="Edit" onclick="load(\'' + element.kode + '\')"> &nbsp;' +
          '<input class="btn btn-danger btn-sm" type="button" value="Hapus" onclick="hapus(\'' + element.kode + '\')">'
        ]).draw();
      })
    }

    function simpan() {
      var method;
      var data = getFormData($('#form-barang'));
      if (modeSubmit == 'insert') {
        method = 'post';
      } else {
        method = 'put';
      }
      $.ajax({
        type: method,
        url: 'barang/',
        data: JSON.stringify(data),
        contentType: 'application/json',
        success: function (d) {
          loadData();
          modeSubmit = 'insert';
          $('#kode, #nama, #harga, #satuan').val('');
        },
        error: function (d) {
          console.log('Error');
        }
      });
    }

    function hapus(kode) {
      $.ajax({
        type: 'delete',
        url: 'barang/' + kode,
        success: function (d) {
          loadData();
        },
        error: function (d) {
          console.log('Error');
        }
      });
    }

    function load(kode) {
      $.ajax({
        type: 'get',
        url: 'barang/' + kode,
        success: function (d) {
          $('#kode').val(d.kode);
          $('#nama').val(d.nama);
          $('#harga').val(d.harga);
          $('#satuan').val(d.satuan);
          modeSubmit = 'update';
        },
        error: function (d) {
          console.log('Error');
        }
      });
    }

    $(document).ready(function () {
      loadData();
      tabelBarang = $('#tabelBarang').DataTable({
        'searching': false,
        'lengthChange': false,
        'lengthMenu': [10]
      });
    });
  </script>
</head>

<body>
      <!-- Main content -->
      <section class="content">

        <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <form id="form-barang">
                <div class="box-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Kode Barang</label>
                        <input type="text" class="form-control" name="kode" id="kode">
                      </div>
                      <div class="form-group">
                        <label>Nama Barang</label>
                        <input type="text" class="form-control" name="nama" id="nama">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>Harga Barang</label>
                        <div class="input-group">
                          <span class="input-group-addon">Rp</span>
                          <input type="number" class="form-control" name="harga" id="harga">
                        </div>
                      </div>
                      <div class="form-group">
                        <label>Satuan</label>
                        <input type="text" class="form-control" name="satuan" id="satuan">
                      </div>
                    </div>
                  </div>
                </div>

                <div class="box-footer">
                  <button type="button" class="btn btn-primary" onclick="simpan()">Submit</button>
                </div>
              </form>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title">Tabel Data Barang</h3>
                <div class="box-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" id="search" class="form-control pull-right" placeholder="Search">
                    <div class="input-group-btn">
                      <button type="button" class="btn btn-default" onclick="loadData()">
                        <i class="fa fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="box-body">
                <table id="tabelBarang" class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th>Kode</th>
                      <th>Nama</th>
                      <th>Harga</th>
                      <th>Satuan</th>
                      <th>Action</th>
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