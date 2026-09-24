<?php
include 'koneksi.php';

$judul = $_POST['judul'];
$penulis = $_POST['penulis'];
$harga = $_POST['harga'];
$tgl_terbit = $_POST['tgl_terbit'];

$sql = "INSERT INTO buku (judul, penulis, harga, tgl_terbit)
VALUES ('$judul', '$penulis', '$harga', '$tgl_terbit')";

if(mysqli_query($koneksi, $sql)) {
    header("Location: index.php");
} else {
    echo "Gagal Menyimpan" . mysqli_error($koneksi);
}
