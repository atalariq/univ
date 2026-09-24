<!DOCTYPE html>
<html>
    <body>
        <h2>Tambah Buku</h2>
        <form action="proses_tambah.php" method="post">
           	<label for="judul">Judul</label>
            <input type="text" name="judul" id="judul">
            <br>
           	<label for="penulis">Penulis</label>
            <input type="text" name="penulis" id="penulis">
            <br>
           	<label for="harga">Harga</label>
            <input type="text" name="harga" id="harga">
            <br>
           	<label for="tgl_terbit">Tanggal Terbit</label>
            <input type="date" name="tgl_terbit" id="tgl_terbit">
            <br>
            <input type="submit" value="Simpan">
        </form>
    </body>
</html>
