import java.util.Scanner;

abstract class Kendaraan {
    private String nomorPlat;
    private String jenis;
    private int waktuMasuk;

    public Kendaraan(String nomorPlat, String jenis, int waktuMasuk) {
        this.nomorPlat = nomorPlat;
        this.jenis = jenis;
        this.waktuMasuk = waktuMasuk;
    }

    public String getNomorPlat() { return nomorPlat; }
    public String getJenis() { return jenis; }
    public int getWaktuMasuk() { return waktuMasuk; }

    public abstract int hitungBiaya(int waktuKeluar);
    public abstract int getJumlahRoda();
}

class Mobil extends Kendaraan {
    public Mobil(String nomorPlat, int waktuMasuk) {
        super(nomorPlat, "Mobil", waktuMasuk);
    }
    @Override public int hitungBiaya(int waktuKeluar) {
        return (waktuKeluar - getWaktuMasuk()) * 5000;
    }
    @Override public int getJumlahRoda() { return 4; }
}

class Motor extends Kendaraan {
    public Motor(String nomorPlat, int waktuMasuk) {
        super(nomorPlat, "Motor", waktuMasuk);
    }
    @Override public int hitungBiaya(int waktuKeluar) {
        return (waktuKeluar - getWaktuMasuk()) * 2000;
    }
    @Override public int getJumlahRoda() { return 2; }
}

public class SistemParkir {
    private static final int MAX_SLOTS = 5;
    private static final int MAX_RODA = 12;

    private static Kendaraan[] slot = new Kendaraan[MAX_SLOTS];
    private static int totalPendapatan = 0;
    private static int kendaraanKeluarCount = 0;
    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {
        boolean running = true;
        while (running) {
            clearScreen();
            System.out.printf("=== SISTEM MANAJEMEN PARKIR OTOMATIS ===\n");
            System.out.printf("1. Lihat Status Parkir\n2. Tambah Kendaraan\n");
            System.out.printf("3. Pindah Kendaraan\n4. Keluar Kendaraan\n5. Exit\n");

            int pilihan = getIntInput("\nPilih Menu (1-5): ", 1, 5);
            switch (pilihan) {
                case 1: clearScreen(); lihatStatus(); pressEnter(); break;
                case 2: clearScreen(); tambah(); pressEnter(); break;
                case 3: clearScreen(); pindah(); pressEnter(); break;
                case 4: clearScreen(); keluar(); pressEnter(); break;
                case 5: clearScreen(); running = false; tampilkanLaporan(); break;
            }
        }
    }

    private static void clearScreen() {
        System.out.printf("\033[H\033[2J");
        System.out.flush();
    }

    private static void pressEnter() {
        System.out.printf("\nTekan ENTER untuk kembali...\n");
        in.nextLine();
    }

    private static int getIntInput(String prompt, int min, int max) {
        while (true) {
            System.out.printf("%s", prompt);
            try {
                int val = Integer.parseInt(in.nextLine().trim());
                if (val >= min && val <= max) return val;
                System.out.printf("  -> Error: Masukkan angka %d hingga %d!\n", min, max);
            } catch (NumberFormatException e) {
                System.out.printf("  -> Error: Input harus berupa angka valid!\n");
            }
        }
    }

    private static void lihatStatus() {
        System.out.printf("STATUS AREA PARKIR (Kapasitas: %d Petak)\n", MAX_SLOTS);
        System.out.printf("----------------------------------------\n");
        System.out.printf("%-5s %-15s %-10s %-5s\n", "Slot", "No. Plat", "Jenis", "Waktu");
        for (int i = 0; i < MAX_SLOTS; i++) {
            if (slot[i] == null) {
                System.out.printf("%-5d %-15s %-10s %-5s\n", (i + 1), "[Kosong]", "-", "-");
            } else {
                System.out.printf("%-5d %-15s %-10s %d:00\n",
                    (i + 1), slot[i].getNomorPlat(), slot[i].getJenis(), slot[i].getWaktuMasuk());
            }
        }
        System.out.printf("----------------------------------------\n");
    }

    private static void tambah() {
        lihatStatus();
        System.out.printf("\nINPUT KENDARAAN BARU\nNomor Plat: ");
        String plat = in.nextLine().trim();

        int jenis = getIntInput("Jenis (1. Mobil, 2. Motor): ", 1, 2);
        int jam = getIntInput("Waktu Masuk (Jam 0-23): ", 0, 23);

        int inputSlot;
        while (true) {
            String p = String.format("Pilih Slot (1-%d): ", MAX_SLOTS);
            inputSlot = getIntInput(p, 1, MAX_SLOTS);
            if (slot[inputSlot - 1] == null) break;
            System.out.printf("  -> Error: Slot %d terisi! Pilih yang kosong.\n", inputSlot);
        }

        int s = inputSlot - 1;
        Kendaraan baru = (jenis == 1) ? new Mobil(plat, jam) : new Motor(plat, jam);

        if (isValid(baru, s)) {
            slot[s] = baru;
            System.out.printf("\nBerhasil! %s diparkir di slot %d\n", baru.getJenis(), inputSlot);
        } else {
            System.out.printf("\nGagal: Melanggar aturan jenis atau batas roda!\n");
        }
    }

    private static boolean isValid(Kendaraan baru, int target) {
        int roda = 0;
        for (Kendaraan k : slot) {
            if (k != null) roda += k.getJumlahRoda();
        }
        if (roda + baru.getJumlahRoda() > MAX_RODA) return false;

        for (int i = 0; i < MAX_SLOTS; i++) {
            if (slot[i] != null) {
                boolean isMobilBaru = baru instanceof Mobil;
                boolean isMotorBaru = baru instanceof Motor;
                boolean isSlotMobil = slot[i] instanceof Mobil;
                boolean isSlotMotor = slot[i] instanceof Motor;

                if (isMobilBaru && i > target && isSlotMotor) return false;
                if (isMotorBaru && i < target && isSlotMobil) return false;
            }
        }
        return true;
    }

    private static void pindah() {
        lihatStatus();
        String p1 = String.format("\nPilih Slot Asal (1-%d): ", MAX_SLOTS);
        int asal = getIntInput(p1, 1, MAX_SLOTS) - 1;

        String p2 = String.format("Pilih Slot Tujuan (1-%d): ", MAX_SLOTS);
        int tujuan = getIntInput(p2, 1, MAX_SLOTS) - 1;

        if (slot[asal] == null) {
            System.out.printf("Gagal: Slot asal kosong!\n");
            return;
        }
        if (slot[tujuan] != null) {
            System.out.printf("Gagal: Slot tujuan sudah terisi!\n");
            return;
        }

        Kendaraan k = slot[asal];
        slot[asal] = null;
        if (isValid(k, tujuan)) {
            slot[tujuan] = k;
            System.out.printf("Berhasil dipindah ke slot %d\n", (tujuan + 1));
        } else {
            slot[asal] = k;
            System.out.printf("Gagal: Perpindahan melanggar aturan penempatan!\n");
        }
    }

    private static void keluar() {
        lihatStatus();
        System.out.printf("\nPROSES KELUAR\nMasukkan Nomor Plat: ");
        String plat = in.nextLine().trim();

        int targetIdx = -1;
        for (int i = 0; i < MAX_SLOTS; i++) {
            if (slot[i] != null && slot[i].getNomorPlat().equalsIgnoreCase(plat)) {
                targetIdx = i;
                break;
            }
        }

        if (targetIdx == -1) {
            System.out.printf("Kendaraan dengan plat %s tidak ditemukan.\n", plat);
            return;
        }

        int wMasuk = slot[targetIdx].getWaktuMasuk();
        int jamK;
        while (true) {
            jamK = getIntInput("Waktu Keluar (Jam 0-23): ", 0, 23);
            if (jamK >= wMasuk) break;
            System.out.printf("  -> Error: Waktu keluar minimal jam %d!\n", wMasuk);
        }

        int biaya = slot[targetIdx].hitungBiaya(jamK);
        totalPendapatan += biaya;
        kendaraanKeluarCount++;

        System.out.printf("\nKendaraan keluar dari slot %d.\n", (targetIdx + 1));
        System.out.printf("Total biaya: Rp%d\n", biaya);
        slot[targetIdx] = null;
    }

    private static void tampilkanLaporan() {
        if (kendaraanKeluarCount == 0) {
            System.out.printf("Parkiran sepi hari ini, semoga besok lebih ramai\n");
        } else {
            System.out.println("REKAP HARIAN");
            System.out.printf("Kendaraan Keluar : %d\n", kendaraanKeluarCount);
            System.out.printf("Total Pendapatan : Rp%d\n", totalPendapatan);
        }
    }
}
