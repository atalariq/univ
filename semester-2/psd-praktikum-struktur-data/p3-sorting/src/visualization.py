from rich.console import Console
from rich.table import Table

# Argumen record=True membolehkan terminal menyimpan log output
console = Console(record=True)

# new_lines_separator = "\n\n\n\n\n\n\n\n\n\n"
new_lines_separator = ""

minimal_svg_format = """<svg class="rich-terminal" viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg">
<!-- Generated with Rich https://www.textualize.io -->
<style>
    @font-face {{
        font-family: "Fira Code";
        src: local("FiraCode-Regular"),
                url("https://cdnjs.cloudflare.com/ajax/libs/firacode/6.2.0/woff2/FiraCode-Regular.woff2") format("woff2"),
                url("https://cdnjs.cloudflare.com/ajax/libs/firacode/6.2.0/woff/FiraCode-Regular.woff") format("woff");
        font-style: normal;
        font-weight: 400;
    }}
    @font-face {{
        font-family: "Fira Code";
        src: local("FiraCode-Bold"),
                url("https://cdnjs.cloudflare.com/ajax/libs/firacode/6.2.0/woff2/FiraCode-Bold.woff2") format("woff2"),
                url("https://cdnjs.cloudflare.com/ajax/libs/firacode/6.2.0/woff/FiraCode-Bold.woff") format("woff");
        font-style: bold;
        font-weight: 700;
    }}

    .{unique_id}-matrix {{
        font-family: Fira Code, monospace;
        font-size: {char_height}px;
        line-height: {line_height}px;
        font-variant-east-asian: full-width;
    }}

    .{unique_id}-title {{
        font-size: 18px;
        font-weight: bold;
        font-family: arial;
    }}

    {styles}

    </style>

    <rect width="100%" height="100%" fill="white" stroke="none"/>
    {backgrounds}
    <g class="{unique_id}-matrix" style="filter: invert(1);">
        {matrix}
    </g>
</svg> """

def print_array(arr, title, active_indices=None, sorted_indices=None):
    if active_indices is None:
        active_indices = []
    if sorted_indices is None:
        sorted_indices = []

    table = Table(title=title, show_header=False, show_lines=True)
    row = []

    for i, val in enumerate(arr):
        color = "white"
        if i in active_indices:
            color = "red"
        elif i in sorted_indices:
            color = "green"
        row.append(f"[{color}]{val}[/{color}]")

    table.add_row(*row)
    console.print(table)


def bubble_sort_visual(arr):
    data = arr.copy()
    n = len(data)
    # console.print("\n[bold cyan]=== Memulai Bubble Sort ===[/bold cyan]")

    for i in range(n):
        print(new_lines_separator)
        console.print(f"> Iterasi ke-{i + 1}")
        for j in range(0, n - i - 1):
            print_array(
                data,
                f"Bandingkan indeks {j} dan {j + 1}",
                [j, j + 1],
                list(range(n - i, n)),
            )
            if data[j] > data[j + 1]:
                data[j], data[j + 1] = data[j + 1], data[j]
                print_array(
                    data,
                    f"Tukar nilai {data[j + 1]} dan {data[j]}",
                    [j, j + 1],
                    list(range(n - i, n)),
                )
        console.save_svg(
            f"bubble_sort_{i + 1}.svg", title="", code_format=minimal_svg_format
        )

    print(new_lines_separator)
    print_array(data, "Hasil Akhir Bubble Sort", [], list(range(n)))
    # Simpan output ke fail SVG
    console.save_svg("bubble_sort.svg", title="", code_format=minimal_svg_format)


def selection_sort_visual(arr):
    data = arr.copy()
    n = len(data)
    # console.print("\n[bold magenta]=== Memulai Selection Sort ===[/bold magenta]")

    for i in range(n):
        print(new_lines_separator)
        console.print(f"> Iterasi ke-{i + 1}")
        min_idx = i
        for j in range(i + 1, n):
            print_array(
                data,
                f"Cari minimum: bandingkan indeks {min_idx} dan {j}",
                [min_idx, j],
                list(range(i)),
            )
            if data[j] < data[min_idx]:
                min_idx = j

        if min_idx != i:
            data[i], data[min_idx] = data[min_idx], data[i]
            print_array(
                data, "Tukar elemen minimum ke depan", [i, min_idx], list(range(i + 1))
            )
        console.save_svg(
            f"selection_sort_{i + 1}.svg", title="", code_format=minimal_svg_format
        )

    print(new_lines_separator)
    print_array(data, "Hasil Akhir Selection Sort", [], list(range(n)))
    # Simpan output ke fail SVG
    console.save_svg("selection_sort.svg", title="", code_format=minimal_svg_format)


def insertion_sort_visual(arr):
    data = arr.copy()
    n = len(data)
    # console.print("\n[bold yellow]=== Memulai Insertion Sort ===[/bold yellow]")

    for i in range(1, n):
        print(new_lines_separator)
        console.print(f"> Iterasi ke-{i}")
        key = data[i]
        j = i - 1
        print_array(data, f"Elemen disisip: {key}", [i], list(range(i)))

        while j >= 0 and key < data[j]:
            data[j + 1] = data[j]
            print_array(data, f"Geser {data[j]} ke kanan", [j, j + 1], list(range(i)))
            j -= 1

        data[j + 1] = key
        print_array(data, f"Sisip {key} ke indeks {j + 1}", [j + 1], list(range(i + 1)))
        console.save_svg(
            f"insertion_sort_{i}.svg", title="", code_format=minimal_svg_format
        )

    print(new_lines_separator)
    print_array(data, "Hasil Akhir Insertion Sort", [], list(range(n)))
    # Simpan output ke fail SVG
    console.save_svg("insertion_sort.svg", title="", code_format=minimal_svg_format)


if __name__ == "__main__":
    target_array = [5, 3, 28, 15, 0, 35, 2]
    selection_sort_visual(target_array)
    insertion_sort_visual(target_array)
    bubble_sort_visual(target_array)
