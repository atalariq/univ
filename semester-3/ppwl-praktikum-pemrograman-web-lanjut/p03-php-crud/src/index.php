<?php
include "koneksi.php";

$sql = "SELECT * FROM buku ORDER BY id DESC";
$hasil = mysqli_query($koneksi, $sql);
?>

<h2>Data Buku</h2>
<a href="tambah.php">Tambah Buku</a>
<table border="1" frame="void" cellpadding="8">
    <tr>
        <th>No.</th>
        <th>Judul Buku</th>
        <th>Penulis</th>
        <th>Harga</th>
        <th>Tanggal Terbit</th>
        <th>Aksi</th>
    </tr>
<?php $no = 1; while($buku = mysqli_fetch_assoc($hasil)) { ?>
    <tr>
        <td><?= $no++ ?></td>
        <td><?= $buku['judul'] ?></td>
        <td><?= $buku['penulis'] ?></td>
        <td><?= $buku['harga'] ?></td>
        <td><?= $buku['tgl_terbit'] ?></td>
        <td>
            <a href="edit.php?id=<?= $buku['id']?>">Edit</a>
            <a href="proses_hapus.php?id=<?= $buku['id']?>">Hapus</a>
        </td>
    </tr>
<?php } ?>
</table>
