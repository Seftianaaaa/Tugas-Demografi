<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Penduduk_model;

class Penduduk extends BaseController
{
	public function index()
	{
		$data = [
			'location'     => 'penduduk'
		];

		return view('penduduk', $data);
	}

	// ------------------------------------------

	// public function add25()
	// {
	// 	$m_penduduk = model(Penduduk_model::class);
	// 	$daftar_nama = ['Abdul Rahman', 'Amesh Anand', 'Amelia Kurniawan', 'Doni Irawan', 'Dodi Suharto', 'Benny Hartono', 'Seftiana Ananda', 'Eddi Sujino', 'Rendra Tjajadi', 'Imam Susanti', 'Abdul Kodhir', 'Erna Susilo', 'Bambang Kurnia', 'Yanuarius Gunawan', 'Juliana', 'Evan Dermawan', 'Denny Christian', 'Bagas Aji Prasetyo', 'Kunia Selo', 'Raka Febrian', 'Febriana', 'Jundai', 'Hasanuddin', 'Iqlimah hayatul', 'Dwi Alya', 'Mutiara Sadira', 'Kevin Pranadi'];
	// 	$tempat_lahir = ['Jakarta', 'Bandung', 'Bogor', 'Bekasi', 'Aceh', 'Padang', 'Pontianak', 'Riau', 'Pekanbaru', 'Banten', 'Jogja'];
	// 	$jenis_kelamin = ['Pria', 'Wanita'];
	// 	for ($i = 0; $i < 25; $i++) {
	// 		$tempat = rand(0, 10);
	// 		$data = [
	// 			'nik' => "3175" . strval(rand(1000, 9999) . rand(1000, 9999) . rand(1000, 9999)),
	// 			'no_kk' => "3175" . strval(rand(1000,9999) . rand(1000, 9999) . rand(1000,9999)),
	// 			'nama_lengkap' => $daftar_nama[$i],
	// 			'tempat_lahir' => $tempat_lahir[$tempat],
	// 			'tgl_lahir' => date('Y/m/d', rand(631220158, 1072896958)),
	// 			'jenis_kelamin' => $jenis_kelamin[rand(0,1)],
	// 			'pendidikan' => rand(1, 9),
	// 			'pendapatan' => rand(1, 5),
	// 			'agama' => rand(1, 8),
	// 			'alamat_lengkap' => $tempat_lahir[rand(0,10)],
	// 			'kelurahan' => rand(1,7),
	// 			'penduduk_asli' => "Ya"
	// 		];
	// 		$m_penduduk->pro_add($data);
	// 	}
	// 	$session = \Config\Services::session();
	// 	$session->setFlashdata('sukses', '25 Data telah ditambahkan');
	// 	return redirect()->to(base_url('penduduk'));
	// }

	// ------------------------------------------

	public function data_penduduk_json()
	{
		$m_penduduk        = new Penduduk_model();
		$rs = $m_penduduk->data_penduduk_json();
		$data = array();
		$no = 1;

		foreach ($rs as $r) {
			$nik = $r->nik;
			$no_kk = $r->no_kk;
			$nama = $r->nama_lengkap;
			$kelurahan = $r->kelurahan;
			$penduduk_asli = $r->penduduk_asli;

			$onclick = "return confirm('Anda Yakin Ingin Menghapus Data Ini ?')";

			$btn = '<a  href="' . base_url() . '/penduduk/edit/' . $nik . '" data-toggle="tooltip" 
                data-placement="top" title="" data-original-title="Edit">
                <i class="bi bi-pencil text-success" >Edit</i></a> ||
				<a href="' . base_url() . '/penduduk/delete/' . $nik . '" data-toggle="tooltip" 
                data-placement="top" title="" data-original-title="Delete" 
                onclick="' . $onclick . '"><i class="bi bi-trash text-danger">Delete</i>
                </a>
				';
			$data[] = array(
				$no,
				$nik,
				$no_kk,
				$nama,
				$kelurahan,
				$penduduk_asli,
				$btn
			);
			$no++;
		}

		$output = array(
			"data" => $data
		);
		echo json_encode($output);
	}

	public function add()
	{
		$m_penduduk        = new Penduduk_model();
		$data = [
			'location'    => 'penduduk',
			'opt_agama'   => $m_penduduk->opt_agama(),
			'opt_kelurahan'   => $m_penduduk->opt_kelurahan(),
			'opt_pendapatan'   => $m_penduduk->opt_pendapatan(),
			'opt_pendidikan'   => $m_penduduk->opt_pendidikan()
		];
		return view('penduduk_add', $data);
	}

	public function pro_add()
	{
		$m_penduduk        = new Penduduk_model();
		$data = [
			'nik' => $this->request->getPost('nik'),
			'no_kk' => $this->request->getPost('no_kk'),
			'nama_lengkap' => $this->request->getPost('nama_lengkap'),
			'tempat_lahir' => $this->request->getPost('tempat_lahir'),
			'tgl_lahir' => $this->request->getPost('tgl_lahir'),
			'jenis_kelamin' => $this->request->getPost('jenis_kelamin'),
			'pendidikan' => $this->request->getPost('pendidikan'),
			'pendapatan' => $this->request->getPost('pendapatan'),
			'agama' => $this->request->getPost('agama'),
			'alamat_lengkap' => $this->request->getPost('alamat_lengkap'),
			'kelurahan' => $this->request->getPost('kelurahan'),
			'penduduk_asli' => $this->request->getPost('penduduk_asli')
		];

		$sqlinsert = $m_penduduk->pro_add($data);
		$session = \Config\Services::session();
		$session->setFlashdata('sukses', 'Data telah ditambah');
		return redirect()->to(base_url('penduduk'));
	}


	public function edit($nik)
	{
		$m_penduduk        = new Penduduk_model();
		$penduduk = $m_penduduk->penduduk_update($nik);
		$data = [
			'location'    => 'penduduk',
			'penduduk'    => $penduduk,
			'opt_agama'   => $m_penduduk->opt_agama(),
			'opt_kelurahan'   => $m_penduduk->opt_kelurahan(),
			'opt_pendapatan'   => $m_penduduk->opt_pendapatan(),
			'opt_pendidikan'   => $m_penduduk->opt_pendidikan()
		];
		return view('penduduk_edit', $data);
	}


	public function pro_edit()
	{
		$m_penduduk        = new Penduduk_model();
		$data_update = [
			'nik' => $this->request->getPost('nik'),
			'no_kk' => $this->request->getPost('no_kk'),
			'nama_lengkap' => $this->request->getPost('nama_lengkap'),
			'tempat_lahir' => $this->request->getPost('tempat_lahir'),
			'tgl_lahir' => $this->request->getPost('tgl_lahir'),
			'jenis_kelamin' => $this->request->getPost('jenis_kelamin'),
			'pendidikan' => $this->request->getPost('pendidikan'),
			'pendapatan' => $this->request->getPost('pendapatan'),
			'agama' => $this->request->getPost('agama'),
			'alamat_lengkap' => $this->request->getPost('alamat_lengkap'),
			'kelurahan' => $this->request->getPost('kelurahan'),
			'penduduk_asli' => $this->request->getPost('penduduk_asli')
		];

		$sqlupdate = $m_penduduk->pro_update($data_update);
		$session = \Config\Services::session();
		$session->setFlashdata('sukses', 'Data telah diubah');
		return redirect()->to(base_url('penduduk'));
	}


	public function delete($nik)
	{

		$m_penduduk        = new Penduduk_model();
		$data              = ['nik' => $nik];
		$delete = $m_penduduk->delete($data);
		$session = \Config\Services::session();
		$session->setFlashdata('sukses', 'Data Berhasil Dihapus');
		return redirect()->to(base_url('penduduk'));
	}
}