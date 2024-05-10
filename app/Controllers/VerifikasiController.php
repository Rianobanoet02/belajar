<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;
use App\Models\VerifikasiModel;
use App\Models\DetailPenatausahaanModel;
use App\Models\SubkegiatanModel;
use App\Models\SubRincianObjekModel;
use CodeIgniter\HTTP\Files\UploadedFile;
class VerifikasiController extends BaseController
{
    protected $VerifikasiModel;
    protected $DetailPenatausahaanModel;
    protected $SubkegiatanModel;
    protected $SubRincianObjekModel;

    public function __construct()
    {
        $this->VerifikasiModel = new VerifikasiModel();
        $this->DetailPenatausahaanModel = new DetailPenatausahaanModel();
        $this->SubkegiatanModel = new SubkegiatanModel();
        $this->SubRincianObjekModel = new SubRincianObjekModel();
    }

    // public function index()
    // {
    //     $verifikasiModel = new VerifikasiModel();
    //     $verifikasi = $verifikasiModel->joinDetailPenatausahaan()->findAll();
    //     $lastQuery = $verifikasiModel->getLastQuery();
    //     // echo $lastQuery;
        

    //     return view('verifikasi/index', ['verifikasi' => $verifikasi]);
    // }

    public function index()
    {
        $data['verifikasi'] = $this->VerifikasiModel->Verifikasi();
        return view('verifikasi/index', $data);
    }

    public function create()
    {
        $data['detailpenatausahaan'] = $this->DetailPenatausahaanModel->getCariDataVerifikasi();
        return view('verifikasi/create', $data);
    }

    public function store()
{
    // Simpan file SPJ
    $fileSPJ = $this->request->getFile('file_spj');
    $fileSPJ->move(ROOTPATH . 'public/uploads/spj');

    // Simpan file kwitansi
    $fileKwitansi = $this->request->getFile('file_kwitansi');
    $fileKwitansi->move(ROOTPATH . 'public/uploads/kwitansi');

    // Buat array data untuk disimpan
    $data = [
        'id_detail_penatausahaan' => $this->request->getPost('id_detail_penatausahaan'),
        'nomor_bku' => $this->request->getPost('nomor_bku'),
        'tanggal' => $this->request->getPost('tanggal'),
        'uraian' => $this->request->getPost('uraian'),
        'nilai_spj' => $this->request->getPost('nilai_spj'),
        'ppn' => $this->request->getPost('ppn'),
        'pph_psl_23' => $this->request->getPost('pph_psl_23'),
        'pph_psl_22' => $this->request->getPost('pph_psl_22'),
        'pph_psl_21' => $this->request->getPost('pph_psl_21'),
        'pajak_daerah' => $this->request->getPost('pajak_daerah'),
        'diterima' => $this->request->getPost('diterima'),
        'file_spj' => $fileSPJ->getName(),
        'file_kwitansi' => $fileKwitansi->getName(),
        'status_bendahara' => $this->request->getPost('status_bendahara'),
        'status_kasubbag' => $this->request->getPost('status_kasubbag'),
        'status_pptik' => $this->request->getPost('status_pptik'),
        'status_verifikator_keuangan' => $this->request->getPost('status_verifikator_keuangan'),
    ];

    $this->VerifikasiModel->insert($data);

    return redirect()->to('/verifikasi');
}



    // public function edit($id)
    // {
    //     $data = [
    //         'verifikasi' => $this->VerifikasiModel->find($id),
    //         'detail_penatausahaan' => $this->DetailPenatausahaanModel->getCariDataVerifikasi()
    //     ];
    //     return view('verifikasi/edit', $data);
    // }

    public function edit($id)
    {
        // Ambil data detail DPA berdasarkan ID
        $verifikasi = $this->VerifikasiModel->find($id);
        $detailpenatausahaan = $this->DetailPenatausahaanModel->getCariDataVerifikasi();  

        $data = [
            'verifikasi' => $verifikasi,
            'detailpenatausahaan' => $detailpenatausahaan,
        ];
    
        return view('verifikasi/edit', $data);
    }

    public function update($id)
    {
        // $fileSPJ = $this->request->getFile('file_spj');
        // $fileSPJ->move(ROOTPATH . 'public/uploads/spj');
    
        // // Simpan file kwitansi
        // $fileKwitansi = $this->request->getFile('file_kwitansi');
        // $fileKwitansi->move(ROOTPATH . 'public/uploads/kwitansi');
    
        // Buat array data untuk disimpan
        $data = [
            'id_detail_penatausahaan' => $this->request->getPost('id_detail_penatausahaan'),
            'nomor_bku' => $this->request->getPost('nomor_bku'),
            'tanggal' => $this->request->getPost('tanggal'),
            'uraian' => $this->request->getPost('uraian'),
            'nilai_spj' => $this->request->getPost('nilai_spj'),
            'ppn' => $this->request->getPost('ppn'),
            'pph_psl_23' => $this->request->getPost('pph_psl_23'),
            'pph_psl_22' => $this->request->getPost('pph_psl_22'),
            'pph_psl_21' => $this->request->getPost('pph_psl_21'),
            'pajak_daerah' => $this->request->getPost('pajak_daerah'),
            'diterima' => $this->request->getPost('diterima'),
            // 'file_spj' => $fileSPJ->getName(),
            // 'file_kwitansi' => $fileKwitansi->getName(),
            // 'status_bendahara' => $this->request->getPost('status_bendahara'),
            // 'status_kasubbag' => $this->request->getPost('status_kasubbag'),
            // 'status_pptik' => $this->request->getPost('status_pptik'),
            // 'status_verifikator_keuangan' => $this->request->getPost('status_verifikator_keuangan'),
        ];

        $this->VerifikasiModel->update($id, $data);

        return redirect()->to('verifikasi');
    }

    public function destroy($id)
    {
        $this->VerifikasiModel->delete($id);

        return redirect()->to('/verifikasi');
    }

    public function preview_spj($id)
{
    // $data['verifikasi'] = $this->VerifikasiModel->find($id);
    // return view('verifikasi/preview_spj', $data);

    $verifikasiModel = new VerifikasiModel();
        $verifikasi = $verifikasiModel->joinDetailPenatausahaan()->findAll($id);
        $lastQuery = $verifikasiModel->getLastQuery();
        // var_dump($lastQuery);
        // echo $lastQuery;
        

        return view('verifikasi/preview_spj', ['verifikasi' => $verifikasi]);
}
//     public function preview_spj($id)
// {
//     $data['verifikasi'] = $this->VerifikasiModel->find($id);
//     return view('verifikasi/preview_spj', $data);
// }

public function download($id)
{
    $data = $this->VerifikasiModel->find($id);
 
    // return $this->response->download(ROOTPATH . 'public/uploads/spj/' . $data['file_spj'], null);
}
public function htmlToPDF(){
    $dompdf = new \Dompdf\Dompdf(); 
    $dompdf->loadHtml(view('pdf_view'));
    $dompdf->setPaper('A4', 'landscape');
    $dompdf->render();
    $dompdf->stream();
}
    
}