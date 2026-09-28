<?php
include "koneksi.php";

$id = $_GET['id'];
$sql = "SELECT * FROM buku WHERE id = '$id'";
$data = mysqli_fetch_assoc(mysqli_query($koneksi, $sql));
?>

<h2>Edit Buku</h2>
<form action="proses_edit.php" method="post">
    <input type="hidden" name="id" id="id" value="<?= $data['id'] ?>">
    <br>
   	<label for="judul">Judul</label>
    <input type="text" name="judul" id="judul" value="<?= $data['judul'] ?>">
    <br>
   	<label for="penulis">Penulis</label>
    <input type="text" name="penulis" id="penulis" value="<?= $data['penulis'] ?>">
    <br>
   	<label for="harga">Harga</label>
    <input type="text" name="harga" id="harga" value="<?= $data['harga'] ?>">
    <br>
   	<label for="tgl_terbit">Tanggal Terbit</label>
    <input type="date" name="tgl_terbit" id="tgl_terbit" value="<?= $data['tgl_terbit'] ?>">
    <br>
    <input type="submit" value="Update">
</form>
