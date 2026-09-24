<?php
include 'koneksi.php';

$id = $_POST['id'];
$judul = $_POST['judul'];
$penulis = $_POST['penulis'];
$harga = $_POST['harga'];
$tgl_terbit = $_POST['tgl_terbit'];

$sql = "UPDATE buku SET
            judul='$judul',
            penulis='$penulis',
            harga='$harga',
            tgl_terbit='$tgl_terbit'
        WHERE id = '$id'";

if(mysqli_query($koneksi, $sql)) {
    header("Location: index.php");
} else {
    echo "Gagal Update:" . mysqli_error($koneksi);
}
