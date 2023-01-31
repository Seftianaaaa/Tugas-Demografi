<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (is_file(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->add('home/login', 'Home::login');
$routes->add('home/logout', 'Home::logout');
$routes->add('dashboard', 'Dashboard::index');
$routes->add('penduduk', 'Penduduk::index');
$routes->add('penduduk/data_penduduk_json', 'Penduduk::data_penduduk_json');
$routes->add('penduduk/add', 'Penduduk::add');
// $routes->add('penduduk/add25', 'Penduduk::add25');
$routes->add('penduduk/edit/(:num)', 'Penduduk::edit/$1');
$routes->add('penduduk/delete/(:num)', 'Penduduk::delete/$1');
$routes->add('penduduk/pro_add', 'Penduduk::pro_add');
$routes->add('penduduk/pro_edit', 'Penduduk::pro_edit');

$routes->add('grafik_gender', 'Grafik_gender::index');
$routes->add('grafik_gender/grafik_gender_json', 'Grafik_gender::grafik_gender_json');

$routes->add('grafik_agama', 'Grafik_agama::index');
$routes->add('grafik_agama/grafik_agama_json', 'Grafik_agama::grafik_agama_json');

$routes->add('grafik_pendapatan', 'Grafik_pendapatan::index');
$routes->add('grafik_pendapatan/grafik_pendapatan_json', 'Grafik_pendapatan::grafik_pendapatan_json');

$routes->add('grafik_pendidikan', 'Grafik_pendidikan::index');
$routes->add('grafik_pendidikan/grafik_pendidikan_json', 'Grafik_pendidikan::grafik_pendidikan_json');

$routes->add('grafik_kelurahan', 'Grafik_kelurahan::index');
$routes->add('grafik_kelurahan/grafik_kelurahan_json', 'Grafik_kelurahan::grafik_kelurahan_json');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}