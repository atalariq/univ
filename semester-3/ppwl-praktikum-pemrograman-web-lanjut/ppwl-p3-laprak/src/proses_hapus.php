<?php
include 'koneksi.php';

$id = $_GET['id'];
$sql = "DELETE FROM buku WHERE id = '$id'";

if(mysqli_query($koneksi, $sql)) {
    header("Location: index.php");
} else {
    echo "Gagal Menghapus:" . mysqli_error($koneksi);
}
