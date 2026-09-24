# PPWL Pertemuan 4 - Routing dan Views

## Tugas

1. Buatlah route dan view untuk halaman website portfolio yang terdiri dari halaman:
   - Home
   - About
   - Education
   - Projects
2. Gunakan Blade Templating: `layout`, `section`, `yield`, `include`
3. Gunakan Named Routes untuk semua link navigasi
4. Load asset dengan `@vite`, bukan `asset()` untuk CSS/JS
5. Push ke git repository, branch pertemuan4

Struktur route yang disarankan:

```php
// routes/web.php
Route::get('/', fn() => view('home'))->name('home');
Route::get('/about', fn() => view('about'))->name('about');
Route::get('/education', fn() => view('education'))->name('education');
Route::get('/projects', fn() => view('projects'))->name('projects');
```
