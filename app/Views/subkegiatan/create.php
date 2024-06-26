<?= $this->extend('layout/app') ?>
<?= $this->section('content') ?>
<div class="main-panel">
    <div class="content-wrapper">
        <!-- breadcrumb -->
        <div class="col-md-12">
            <div class="row">
                <div class="col-12 col-xl-8 ">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Master</a></li>
                        <li class="breadcrumb-item"><a href="/subkegiatan">Sub Kegiatan</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tambah</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- end breadcrumb -->
        <div class="row">
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Tambah Data Sub Kegiatan</h4>
                        <form action="/subkegiatan/store/" method="post">
                            <div class="form-group">
                                <label>Kode urusan</label>
                                <select class="form-control" name="id_urusan" id="id_urusan" required>
                                    <option selected disabled>-</option>
                                    <?php foreach ($urusan as $key) : ?>
                                        <option value="<?= $key['id']; ?>"><?= $key['kode_urusan']; ?> - <?= $key['nama_urusan']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Kode bidang urusan</label>
                                <select class="form-control" name="id_bidang_urusan" id="id_bidang_urusan" required>

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Kode program</label>
                                <select class="form-control" name="id_program" id="id_program" required>

                                </select>
                            </div>

                            <div class="form-group">
                                <label>Kode kegiatan</label>
                                <select class="form-control" name="id_kegiatan" id="id_kegiatan" required>

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Kode Subkegiatan</label>
                                <input type="text" name="kode_subkegiatan" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Nomenklatur Urusan Provinsi</label>
                                <input type="text" name="nomenklatur_urusan_provinsi" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Kinerja</label>
                                <input type="text" name="kinerja" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Indikator</label>
                                <input type="text" name="indikator" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Satuan</label>
                                <input type="text" name="satuan" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-success mr-2">Simpan</button>
                            <!-- <button class="btn btn-light">Batal</button> -->
                            <a href="<?= base_url('/kegiatan'); ?>" class="btn btn-danger">Batal</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- content-wrapper ends -->
    <!-- partial:partials/_footer.html -->
    <?= $this->include('layout/footer') ?>
    <!-- partial -->
</div>
<?= $this->endSection() ?>

<?= $this->section('styles') ?>
<!-- link ref -->
<?= $this->endSection() ?>


<?= $this->section('javascript') ?>
<script type="text/javascript">
    $(document).ready(function() {
        // ajax method for get kelompok option
        $('#id_urusan').change(function() {
            var id_urusan = $(this).val();
            if (id_urusan != '') {
                $.ajax({
                    url: '/subkegiatan/getBidangUrusan/' + id_urusan,
                    type: 'get',
                    dataType: 'json',
                    success: function(response) {
                        var options = '<option value="">- Pilih Bidang Urusan -</option>';
                        $.each(response, function(index, value) {
                            options += '<option value="' + value.id + '">' + value.kode_bidang_urusan + ' - ' + value.nama_bidang_urusan + '</option>';
                        });
                        $('#id_bidang_urusan').html(options);
                    }
                });
            }
        });

        // ajax method for get jenis option
        $('#id_bidang_urusan').change(function() {
            var id_bidang_urusan = $(this).val();
            if (id_bidang_urusan != '') {
                $.ajax({
                    url: '/subkegiatan/getProgram/' + id_bidang_urusan,
                    type: 'get',
                    dataType: 'json',
                    success: function(response) {
                        var options = '<option value="">- Pilih Program -</option>';
                        $.each(response, function(index, value) {
                            options += '<option value="' + value.id + '">' + value.kode_program + ' - ' + value.nama_program + '</option>';
                        });
                        $('#id_program').html(options);
                    }
                });
            }
        });

        // ajax method for get jenis option
        $('#id_program').change(function() {
            var id_program = $(this).val();
            if (id_program != '') {
                $.ajax({
                    url: '/subkegiatan/getKegiatan/' + id_program,
                    type: 'get',
                    dataType: 'json',
                    success: function(response) {
                        var options = '<option value="">- Pilih Kegiatan -</option>';
                        $.each(response, function(index, value) {
                            options += '<option value="' + value.id + '">' + value.kode_kegiatan + ' - ' + value.nama_kegiatan + '</option>';
                        });
                        $('#id_kegiatan').html(options);
                    }
                });
            }
        });

     
    });
</script>
<?= $this->endSection() ?>