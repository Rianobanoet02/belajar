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
                        <li class="breadcrumb-item"><a href="/subkegiatan">Sub Rincian Objek</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- end breadcrumb -->
        <div class="row">
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Edit Data Sub Rincian Objek</h4>
                        <form action="/subkegiatan/update/<?= $subkegiatan['id']; ?>" method="post">
                            <div class="form-group">
                                <label>Kode Urusan</label>
                                <select class="form-control" name="id_urusan" id="id_urusan" required>
                                    <option selected disabled>-</option>
                                    <?php foreach ($urusan as $key) : ?>
                                        <option value="<?= $key['id']; ?>" <?php if ($key['id'] == $subkegiatan['id_urusan']) echo 'selected="selected"' ?>><?= $key['kode_urusan']; ?> - <?= $key['nama_urusan']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Kode Bidang Urusan</label>
                                <select class="form-control" name="id_bidang_urusan" id="id_bidang_urusan" required>
                                    <?php foreach ($bidang_urusan as $key) : ?>
                                        <option value="<?= $key['id']; ?>" <?php if ($key['id'] == $subkegiatan['id_bidang_urusan']) echo 'selected="selected"' ?>><?= $key['kode_bidang_urusan']; ?> - <?= $key['nama_bidang_urusan']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Kode program</label>
                                <select class="form-control" name="id_program" id="id_program" required>
                                    <?php foreach ($program as $key) : ?>
                                        <option value="<?= $key['id']; ?>" <?php if ($key['id'] == $subkegiatan['id_program']) echo 'selected="selected"' ?>><?= $key['kode_program1']; ?> - <?= $key['nama_program']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                                <div class="form-group">
                                <label>Kode kegiatan</label>
                                <select class="form-control" name="id_kegiatan" id="id_kegiatan" required>
                                    <?php foreach ($kegiatan as $key) : ?>
                                        <option value="<?= $key['id']; ?>" <?php if ($key['id'] == $subkegiatan['id_kegiatan']) echo 'selected="selected"' ?>><?= $key['kode_kegiatan1']; ?> - <?= $key['nama_kegiatan']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Kode Sub Kegiatan</label>
                                <input type="text" name="kode_subkegiatan" class="form-control" value="<?= $subkegiatan['kode_subkegiatan']; ?>" required>
                            </div>
<!-- Nomenklatur Urusan Provinsi -->
                            <div class="form-group">
                                <label>Nomenklatur Urusan Provinsi</label>
                                <input type="text" name="nomenklatur_urusan_provinsi" class="form-control" value="<?= $subkegiatan['nomenklatur_urusan_provinsi']; ?>" required>
                            </div>
                            <button type="submit" class="btn btn-success mr-2">Simpan</button>
                            <!-- <button class="btn btn-light">Batal</button> -->
                            <a href="<?= base_url('/subkegiatan'); ?>" class="btn btn-danger">Batal</a>
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

        // ajax method for get objek option
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