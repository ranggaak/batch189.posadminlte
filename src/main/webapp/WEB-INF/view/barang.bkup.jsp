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
            
            <div class="col-md-3">
            	<h4 class="mb-3 mt-3">Form Barang</h4>
            	<form id="form-barang">
                <div class="mb-3">
                    <label>Kode Barang</label>
                    <input type="text" class="form-control" id="kode" name="kode">
                </div>
                <div class="mb-3">
                    <label>Nama Barang</label>
                    <input type="text" class="form-control" id="nama" name="nama">
                </div>
                <div class="mb-3">
                    <label>Harga</label>
                    <input type="text" class="form-control" id="harga" name="harga">
                </div>
                <div class="mb-3">
                    <label>Satuan</label>
                    <input type="text" class="form-control" id="satuan" name="satuan">
                </div>
                <hr class="mb-4">
                <input class="btn btn-primary btn-lg" type="button" value="Submit" onclick="simpan()">
                </form>
            </div>
            
            <div class="col-md-9">
            	<h4 class="mb-3 mt-3">Data Barang</h4>
				<div class="table-responsive">
				  <table class="table table-striped table-sm">
				    <thead>
				      <tr>
				        <th>Kode Barang</th>
				        <th>Nama Barang</th>
				        <th>Harga</th>
				        <th>Satuan</th>
				        <th>Action</th>
				      </tr>
				    </thead>
				    <tbody id="data-barang">
				    </tbody>
				  </table>
				</div>    
            </div>
            
        </div>
    </div>
	<script>

		var modeSubmit = 'insert';

		function getFormData($form){
		    var unindexed_array = $form.serializeArray();
		    var indexed_array = {};
		    $.map(unindexed_array, function(n, i){
		        indexed_array[n['name']] = n['value'];
		    });
		    return indexed_array;
		}
		
		function tampilkanData(d) {
			var s = '';
			$(d).each(function(index, element) {
				s += '<tr>';
				s += '<td>' + element.kode + '</td>';
				s += '<td>' + element.nama + '</td>';
				s += '<td>' + element.harga + '</td>';
				s += '<td>' + element.satuan + '</td>';
				s += '<td>' + 
						'<input class="btn btn-secondary btn-sm" type="button" value="Edit" onclick="load(\'' + element.kode + '\')"> &nbsp;' +
						'<input class="btn btn-danger btn-sm" type="button" value="Hapus" onclick="hapus(\'' + element.kode + '\')">' +
				     '</td>';
			    s += '</tr>';
			})
            $('#data-barang').html(s);
		}

        function loadData() {
            $.ajax({
                type: 'get',
                url: 'barang/',
                success: function(d) {
                    tampilkanData(d);
                },
                error: function(d) {
					console.log('Error');
                }
            });
        }

        function simpan() {
            var method;
            var data = getFormData($('#form-barang'));
			if(modeSubmit == 'insert') {
				method = 'post';
			} else {
				method = 'put';
			}
			$.ajax({
                type: method,
                url: 'barang/',
                data: JSON.stringify(data),
                contentType: 'application/json',
                success: function(d) {
                    loadData();
                    modeSubmit = 'insert';
                    $('#kode, #nama, #harga, #satuan').val('');
                },
                error: function(d) {
					console.log('Error');
                }
            });
        }

        function hapus(kode) {
            $.ajax({
                type: 'delete',
                url: 'barang/' + kode,
                success: function(d) {
                    loadData();
                },
                error: function(d) {
					console.log('Error');
                }
            });
        }

        function load(kode) {
			$.ajax({
				type: 'get',
				url: 'barang/' + kode,
				success: function(d) {
					$('#kode').val(d.kode);
					$('#nama').val(d.nama);
					$('#harga').val(d.harga);
					$('#satuan').val(d.satuan);
					modeSubmit = 'update';
				},
                error: function(d) {
					console.log('Error');
                }
			});
        }

        $(document).ready(function() {
            loadData();
        });

	</script>
</body>

</html>
