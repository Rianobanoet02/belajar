<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
// $routes->get('/', 'Home::ind


// Rute untuk menampilkan halaman login
$routes->get('/', 'Home::index', ['filter' => 'auth']);
$routes->get('/starter', 'Home::starter', ['filter' => 'auth']);

 // Rute untuk proses login
 $routes->post('auth/processLogin', 'AuthController::processLogin', ['as' => 'auth/processLogin']);

$routes->group('/auth', function ($routes) {
   $routes->get('/', 'AuthController::index');
   $routes->post('login', 'AuthController::login');
   $routes->get('logout', 'AuthController::logout');
});

$routes->get('/dashboard', 'Home::index', ['filter' => 'auth']);


$routes->group('user', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'UserController::index');
   $routes->get('create', 'UserController::create');
   $routes->post('store', 'UserController::store');
   $routes->post('update/(:num)', 'UserController::update/$1');
   $routes->get('edit/(:num)', 'UserController::edit/$1');
   $routes->get('delete/(:num)', 'UserController::delete/$1');
   $routes->get('show/(:num)', 'UserController::show/$1');
});

$routes->group('karyawan', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'KaryawanController::index');
   $routes->get('create', 'KaryawanController::create');
   $routes->post('store', 'KaryawanController::store');
   $routes->post('update/(:num)', 'KaryawanController::update/$1');
   $routes->get('edit/(:num)', 'KaryawanController::edit/$1');
   $routes->get('delete/(:num)', 'KaryawanController::delete/$1');
   $routes->get('show/(:num)', 'KaryawanController::show/$1');
});

$routes->group('datarekening', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'DataRekeningController::index');
   $routes->get('create', 'DataRekeningController::create');
   $routes->post('store', 'DataRekeningController::store');
   $routes->post('update/(:num)', 'DataRekeningController::update/$1');
   $routes->get('edit/(:num)', 'DataRekeningController::edit/$1');
   $routes->get('delete/(:num)', 'DataRekeningController::destroy/$1');
   $routes->get('show/(:num)', 'DataRekeningController::show/$1');
});

$routes->group('rakbelanja', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'RakBelanjaController::index');
   $routes->get('create', 'RakBelanjaController::create');
   $routes->post('store', 'RakBelanjaController::store');
   $routes->post('update/(:num)', 'RakBelanjaController::update/$1');
   $routes->get('edit/(:num)', 'RakBelanjaController::edit/$1');
   $routes->get('delete/(:num)', 'RakBelanjaController::destroy/$1');
});

$routes->group('detailrak', ['filter' => 'auth'], function ($routes) {
   $routes->get('show/(:num)', 'DetailRakController::show/$1');
   $routes->get('create/(:num)', 'DetailRakController::create/$1');
   $routes->post('store', 'DetailRakController::store');
   $routes->post('update/(:num)', 'DetailRakController::update/$1');
   $routes->get('edit/(:num)', 'DetailRakController::edit/$1');
   $routes->get('delete/(:num)', 'DetailRakController::destroy/$1');
});

$routes->group('akun', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'AkunController::index');
   $routes->get('create', 'AkunController::create');
   $routes->post('store', 'AkunController::store');
   $routes->post('update/(:num)', 'AkunController::update/$1');
   $routes->get('edit/(:num)', 'AkunController::edit/$1');
   $routes->get('delete/(:num)', 'AkunController::destroy/$1');
});

$routes->group('kelompok', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'KelompokController::index');
   $routes->get('create', 'KelompokController::create');
   $routes->post('store', 'KelompokController::store');
   $routes->post('update/(:num)', 'KelompokController::update/$1');
   $routes->get('edit/(:num)', 'KelompokController::edit/$1');
   $routes->get('delete/(:num)', 'KelompokController::destroy/$1');
});

$routes->group('jenis', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'JenisController::index');
   $routes->get('create', 'JenisController::create');
   $routes->post('store', 'JenisController::store');
   $routes->post('update/(:num)', 'JenisController::update/$1');
   $routes->get('edit/(:num)', 'JenisController::edit/$1');
   $routes->get('delete/(:num)', 'JenisController::destroy/$1');
});

$routes->group('objek', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'ObjekController::index');
   $routes->get('create', 'ObjekController::create');
   $routes->post('store', 'ObjekController::store');
   $routes->post('update/(:num)', 'ObjekController::update/$1');
   $routes->get('edit/(:num)', 'ObjekController::edit/$1');
   $routes->get('delete/(:num)', 'ObjekController::destroy/$1');
});

$routes->group('rincianobjek', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'RincianObjekController::index');
   $routes->get('create', 'RincianObjekController::create');
   $routes->post('store', 'RincianObjekController::store');
   $routes->post('update/(:num)', 'RincianObjekController::update/$1');
   $routes->get('edit/(:num)', 'RincianObjekController::edit/$1');
   $routes->get('delete/(:num)', 'RincianObjekController::destroy/$1');
});

$routes->group('subrincian', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'SubRincianObjekController::index');
   $routes->get('create', 'SubRincianObjekController::create');
   $routes->post('store', 'SubRincianObjekController::store');
   $routes->post('update/(:num)', 'SubRincianObjekController::update/$1');
   $routes->get('edit/(:num)', 'SubRincianObjekController::edit/$1');
   $routes->get('delete/(:num)', 'SubRincianObjekController::destroy/$1');
   $routes->get('getKelompok/(:num)', 'SubRincianObjekController::getKelompok/$1');
   $routes->get('getJenis/(:num)', 'SubRincianObjekController::getJenis/$1');
   $routes->get('getObjek/(:num)', 'SubRincianObjekController::getObjek/$1');
   $routes->get('getRincianObjek/(:num)', 'SubRincianObjekController::getRincianObjek/$1');
});

$routes->group('penatausahaan', ['filter' => 'auth'], function ($routes) {
   $routes->get('/', 'PenataUsahaanController::index');
   $routes->get('create', 'PenataUsahaanController::create');
   $routes->post('store', 'PenataUsahaanController::store');
   $routes->post('update/(:num)', 'PenataUsahaanController::update/$1');
   $routes->get('edit/(:num)', 'PenataUsahaanController::edit/$1');
   $routes->get('delete/(:num)', 'PenataUsahaanController::destroy/$1');
});
