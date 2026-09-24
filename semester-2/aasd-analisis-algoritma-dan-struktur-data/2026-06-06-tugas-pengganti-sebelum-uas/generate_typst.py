#!/usr/bin/env python3
"""Generate jawaban-latihan-asd.typ - full TSP solutions DP + BnB."""

import math, heapq, json

INF = float('inf')

# ============================================================
# DATA
# ============================================================

matrices_dp = [
    ("Soal 1: Distribusi Barang Antar Gudang", ["A","B","C","D","E"],
     [[0,12,18,25,20],[12,0,14,17,28],[18,14,0,16,22],[25,17,16,0,15],[20,28,22,15,0]]),
    ("Soal 2: Pengiriman Paket Antar Kota", ["P","Q","R","S","T","U"],
     [[0,8,12,15,20,10],[8,0,18,14,11,17],[12,18,0,9,13,16],[15,14,9,0,7,12],[20,11,13,7,0,10],[10,17,16,12,10,0]]),
    ("Soal 3: Rute Inspeksi Jaringan Telekomunikasi", ["A","B","C","D","E","F","G"],
     [[0,11,14,20,18,16,22],[11,0,9,15,13,17,21],[14,9,0,12,10,19,18],[20,15,12,0,8,11,14],[18,13,10,8,0,9,12],[16,17,19,11,9,0,7],[22,21,18,14,12,7,0]]),
    ("Soal 4: Distribusi Produk E-Commerce", ["A","B","C","D","E","F"],
     [[0,6,14,18,11,20],[6,0,10,12,15,16],[14,10,0,8,13,9],[18,12,8,0,7,11],[11,15,13,7,0,10],[20,16,9,11,10,0]]),
    ("Soal 5: Jalur Robot Pengantar di Pabrik", ["A","B","C","D","E","F","G","H"],
     [[0,5,12,9,14,18,20,11],[5,0,7,13,10,16,22,15],[12,7,0,8,9,12,17,10],[9,13,8,0,6,11,14,7],[14,10,9,6,0,8,13,12],[18,16,12,11,8,0,9,10],[20,22,17,14,13,9,0,6],[11,15,10,7,12,10,6,0]]),
]

matrices_bnb = [
    ("Soal 1: Distribusi Produk Farmasi", ["A","B","C","D","E","F"],
     [[0,12,18,25,16,22],[12,0,20,17,14,28],[18,20,0,15,24,11],[25,17,15,0,13,19],[16,14,24,13,0,10],[22,28,11,19,10,0]]),
    ("Soal 2: Pengiriman Barang E-Commerce", ["P","Q","R","S","T","U"],
     [[0,9,14,21,17,24],[9,0,19,16,12,26],[14,19,0,13,22,10],[21,16,13,0,11,15],[17,12,22,11,0,8],[24,26,10,15,8,0]]),
    ("Soal 3: Jalur Inspeksi Teknisi Jaringan", ["A","B","C","D","E","F","G"],
     [[0,11,16,20,18,24,15],[11,0,14,17,12,19,21],[16,14,0,10,15,13,18],[20,17,10,0,8,11,14],[18,12,15,8,0,9,13],[24,19,13,11,9,0,7],[15,21,18,14,13,7,0]]),
    ("Soal 4: Distribusi Makanan Beku", ["A","B","C","D","E","F"],
     [[0,13,21,19,15,27],[13,0,18,16,11,24],[21,18,0,14,20,9],[19,16,14,0,12,17],[15,11,20,12,0,8],[27,24,9,17,8,0]]),
    ("Soal 5: Rute Robot Pengantar Barang", ["A","B","C","D","E","F","G"],
     [[0,8,15,18,14,20,17],[8,0,12,16,11,19,22],[15,12,0,9,13,10,18],[18,16,9,0,7,12,14],[14,11,13,7,0,8,11],[20,19,10,12,8,0,6],[17,22,18,14,11,6,0]]),
]

# ============================================================
# ALGORITHMS
# ============================================================

def held_karp_trace(matrix, labels):
    n = len(matrix)
    dp = {}
    parent = {}
    dp[(1, 0)] = 0

    for mask in range(1, 1 << n):
        if not (mask & 1):
            continue
        for last in range(n):
            if not (mask & (1 << last)):
                continue
            if (mask, last) not in dp:
                continue
            cur_cost = dp[(mask, last)]
            for nxt in range(n):
                if mask & (1 << nxt):
                    continue
                new_mask = mask | (1 << nxt)
                new_cost = cur_cost + matrix[last][nxt]
                key = (new_mask, nxt)
                if new_cost < dp.get(key, INF):
                    dp[key] = new_cost
                    parent[key] = (mask, last)

    states_by_size = {}
    for mask in range(1, 1 << n):
        if not (mask & 1):
            continue
        sz = mask.bit_count()
        if sz not in states_by_size:
            states_by_size[sz] = []
        for last in range(n):
            if not (mask & (1 << last)):
                continue
            if (mask, last) in dp:
                visited = [labels[i] for i in range(n) if mask & (1 << i)]
                states_by_size[sz].append({
                    'mask': format(mask, '0{}b'.format(n)),
                    'visited': '{' + ', '.join(visited) + '}',
                    'last': labels[last],
                    'cost': dp[(mask, last)]
                })

    full_mask = (1 << n) - 1
    best_cost = INF
    best_last = -1
    close_candidates = []
    for last in range(1, n):
        key = (full_mask, last)
        if key in dp:
            total = dp[key] + matrix[last][0]
            close_candidates.append((labels[last], dp[key], matrix[last][0], total))
            if total < best_cost:
                best_cost = total
                best_last = last

    route_idx = []
    route_edges = []
    mask = full_mask
    last = best_last
    while (mask, last) in parent:
        pmask, plast = parent[(mask, last)]
        route_idx.append(last)
        route_edges.append((labels[plast], labels[last], matrix[plast][last]))
        mask, last = pmask, plast
    route_idx.append(0)
    route_idx.reverse()
    route_idx.append(0)
    route_edges.reverse()
    route_edges.append((labels[best_last], labels[0], matrix[best_last][0]))
    route_labels = [labels[i] for i in route_idx]

    return {
        'cost': best_cost, 'route': route_labels, 'route_edges': route_edges,
        'states_by_size': states_by_size, 'dp_size': len(dp),
        'close_candidates': close_candidates, 'n': n, 'labels': labels, 'matrix': matrix
    }


def reduce_matrix_detail(mat):
    n = len(mat)
    m = [row[:] for row in mat]
    total = 0
    row_red = []
    for i in range(n):
        vals = [v for v in m[i] if v != INF]
        if not vals:
            row_red.append(0); continue
        rm = min(vals)
        row_red.append(rm)
        if rm > 0:
            total += rm
            for j in range(n):
                if m[i][j] != INF:
                    m[i][j] -= rm
    after_row = [row[:] for row in m]
    col_red = []
    for j in range(n):
        vals = [m[i][j] for i in range(n) if m[i][j] != INF]
        if not vals:
            col_red.append(0); continue
        cm = min(vals)
        col_red.append(cm)
        if cm > 0:
            total += cm
            for i in range(n):
                if m[i][j] != INF:
                    m[i][j] -= cm
    after_col = [row[:] for row in m]
    return total, m, row_red, col_red, after_row, after_col


def reduce_quick(mat2):
    n = len(mat2)
    tot = 0
    for i in range(n):
        vals = [v for v in mat2[i] if v != INF]
        if not vals: continue
        rm = min(vals)
        if rm > 0:
            tot += rm
            for j in range(n):
                if mat2[i][j] != INF:
                    mat2[i][j] -= rm
    for j in range(n):
        vals = [mat2[i][j] for i in range(n) if mat2[i][j] != INF]
        if not vals: continue
        cm = min(vals)
        if cm > 0:
            tot += cm
            for i in range(n):
                if mat2[i][j] != INF:
                    mat2[i][j] -= cm
    return tot


def tsp_bnb_trace(matrix_orig, labels):
    n = len(matrix_orig)
    init_lb, init_reduced, row_red, col_red, after_row, after_col = reduce_matrix_detail(matrix_orig)

    best_cost = INF
    best_path = None
    nodes_explored = 0

    pq = [(init_lb, 0, [0], init_reduced, 0, 1, 0)]
    counter = 1
    tree_levels = {}

    while pq:
        lb, _, path, mat, cost_so_far, visited_mask, last = heapq.heappop(pq)
        nodes_explored += 1

        level = len(path) - 1
        if level not in tree_levels:
            tree_levels[level] = []

        action = "explored"
        if lb >= best_cost:
            action = "pruned (LB $>= " + str(best_cost) + "$)"

        tree_levels[level].append({
            'path': [labels[i] for i in path],
            'lb': lb,
            'cost_so_far': cost_so_far,
            'action': action
        })

        if lb >= best_cost:
            continue

        if len(path) == n:
            total = cost_so_far + matrix_orig[last][0]
            if total < best_cost:
                best_cost = total
                best_path = path + [0]
            continue

        children_info = []
        for nxt in range(n):
            if visited_mask & (1 << nxt):
                continue
            new_cost = cost_so_far + matrix_orig[last][nxt]
            child_mat = [row[:] for row in mat]
            for k in range(n):
                child_mat[last][k] = INF
                child_mat[k][nxt] = INF
            child_mat[nxt][0] = INF
            child_lb_red = reduce_quick(child_mat)
            child_lb = new_cost + child_lb_red
            if child_lb < best_cost:
                children_info.append((child_lb, nxt, new_cost, child_lb_red))
                heapq.heappush(pq, (child_lb, counter,
                    path + [nxt], child_mat, new_cost,
                    visited_mask | (1 << nxt), nxt))
                counter += 1

        if level <= 2:
            tree_levels[level][-1]['children'] = [(labels[c[1]], c[0], c[2], c[3]) for c in sorted(children_info)]

    route = [labels[i] for i in best_path] if best_path else []
    return {
        'cost': best_cost, 'route': route, 'nodes_explored': nodes_explored,
        'tree_levels': tree_levels, 'init_lb': init_lb, 'row_red': row_red,
        'col_red': col_red, 'after_row': after_row, 'after_col': after_col,
        'n': n, 'labels': labels, 'matrix': matrix_orig
    }


# ============================================================
# TYPST GENERATION
# ============================================================

def typst_matrix(mat, labels):
    n = len(mat)
    lines = []
    lines.append("  columns: " + str(n+1) + ",")
    header_cells = [""] + labels
    lines.append("  [" + "], [".join(header_cells) + "],")
    for i, row in enumerate(mat):
        cells = [labels[i]] + [str(x) for x in row]
        lines.append("  [" + "], [".join(cells) + "],")
    return "\n".join(lines)


def generate_typst(dp_traces, bnb_traces):
    out = []

    out.append(r"""#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(font: "Times New Roman", size: 10pt)
#set enum(numbering: "a)")
#set table(align: center + horizon, inset: 5pt)
#show table.cell.where(y: 0): set text(weight: "bold")
#show table.cell.where(x: 0): set text(weight: "bold")

#align(center, text(size: 13pt, weight: "bold")[JAWABAN SOAL LATIHAN
ANALISIS ALGORITMA DAN STRUKTUR DATA])

#v(0.3cm)

= Bagian 1: Dynamic Programming (Held-Karp Algorithm)

""")

    # ---- DP SECTION ----
    for title, trace in dp_traces:
        n = trace['n']
        labels = trace['labels']
        start = labels[0]

        out.append("== " + title + "\n\n")

        # a) Formulation
        out.append("*Formulasi Held-Karp:*\n\n")
        out.append("State DP: $C(S, i)$ = biaya minimum untuk mengunjungi semua kota dalam ")
        out.append("himpunan $S$ (dimulai dari " + start + "), dan berakhir di kota $i$.\n\n")
        out.append("Relasi rekurens:\n")
        out.append("$ C(S, i) = min_(j in S \\ {i}) {C(S \\ {i}, j) + d(j, i)} $\n\n")
        out.append("Basis: $C({" + start + "}, " + start + ") = 0$\n\n")
        out.append("Solusi: $min_(i != " + start + ") {C(V, i) + d(i, " + start + ")}$ ")
        out.append("dengan $V$ adalah himpunan semua kota.\n\n")

        # b) DP states table
        out.append("*Tabel State DP (per ukuran himpunan):*\n\n")

        for sz in sorted(trace['states_by_size'].keys()):
            states = trace['states_by_size'][sz]
            out.append("*Ukuran* $|S| = " + str(sz) + "$:\n\n")
            out.append("#table(columns: 4, [Mask (biner)], [Kota dikunjungi], [Berakhir di], [$C(S, i)$],\n")
            for s in states:
                out.append("  [" + s['mask'] + "], [" + s['visited'] + "], [" + s['last'] + "], [" + str(s['cost']) + "],\n")
            out.append(")\n\n")

        # c) Close tour
        out.append("*Penutupan Tur (kembali ke " + start + "):*\n\n")
        out.append("#table(columns: 4, [Akhir di], [$C(V, i)$], [$d(i, " + start + ")$], [Total],\n")
        for cand in trace['close_candidates']:
            out.append("  [" + cand[0] + "], [" + str(cand[1]) + "], [" + str(cand[2]) + "], [" + str(cand[3]) + "],\n")
        out.append(")\n\n")

        # d) Optimal solution
        out.append("*Biaya minimum:* " + str(trace['cost']) + "\n\n")
        route_str = " $arrow.r$ ".join(trace['route'])
        out.append("*Rute optimal:* " + route_str + "\n\n")

        out.append("*Rincian rute:*\n\n")
        out.append("#table(columns: 3, [Dari], [Ke], [Jarak],\n")
        for fr, to, dist in trace['route_edges']:
            out.append("  [" + fr + "], [" + to + "], [" + str(dist) + "],\n")
        out.append("  [*Total*], [], [*" + str(trace['cost']) + "*],\n")
        out.append(")\n\n")

        # e) Complexity
        max_theoretical = (n - 1) * (2 ** (n - 2))
        out.append("*Kompleksitas:* Jumlah state yang dihitung = " + str(trace['dp_size']) + ", ")
        out.append("maksimum teoritis $(n-1) dot 2^{n-2}$ = " + str(max_theoretical) + "\n\n")

        out.append("#pagebreak()\n\n")

    # ---- BNB SECTION ----
    out.append("= Bagian 2: Branch and Bound\n\n")

    for title, trace in bnb_traces:
        n = trace['n']
        labels = trace['labels']
        start = labels[0]

        out.append("== " + title + "\n\n")

        # a) Formulation
        out.append("*Formulasi Branch and Bound:*\n\n")
        out.append("Algoritma Branch and Bound untuk TSP menggunakan reduksi matriks biaya ")
        out.append("untuk menghitung _lower bound_ (LB) setiap node.\n\n")

        # b) Initial lower bound
        out.append("*Perhitungan Lower Bound Awal:*\n\n")

        out.append("*Reduksi baris*:\n\n")
        out.append("#table(columns: 2, [Baris], [Nilai reduksi],\n")
        for i, l in enumerate(labels):
            out.append("  [" + l + "], [" + str(trace['row_red'][i]) + "],\n")
        out.append(")\n\n")

        out.append("Matriks setelah reduksi baris:\n\n")
        out.append("#table(\n" + typst_matrix(trace['after_row'], labels) + "\n)\n\n")

        out.append("*Reduksi kolom*:\n\n")
        out.append("#table(columns: 2, [Kolom], [Nilai reduksi],\n")
        for i, l in enumerate(labels):
            out.append("  [" + l + "], [" + str(trace['col_red'][i]) + "],\n")
        out.append(")\n\n")

        out.append("Matriks setelah reduksi kolom (tereduksi penuh):\n\n")
        out.append("#table(\n" + typst_matrix(trace['after_col'], labels) + "\n)\n\n")

        sum_row = sum(trace['row_red'])
        sum_col = sum(trace['col_red'])
        out.append("Total reduksi: " + str(sum_row) + " + " + str(sum_col) + " = " + str(trace['init_lb']) + "\n\n")
        out.append("*Lower bound awal* $= " + str(trace['init_lb']) + "$\n\n")

        # c) Tree search
        out.append("*Pohon pencarian Branch and Bound:*\n\n")

        for level in sorted(trace['tree_levels'].keys()):
            if level > 3:
                break
            nodes = trace['tree_levels'][level]
            out.append("*Level* " + str(level) + " (" + str(len(nodes)) + " node):\n\n")

            for node in nodes[:10]:  # show first 10 nodes per level
                path_str = " $arrow.r$ ".join(node['path'])
                out.append("- Node: " + path_str + " — LB = " + str(node['lb']))
                out.append(", cost so far = " + str(node['cost_so_far']))
                if node['action'] != 'explored':
                    out.append(", *" + node['action'] + "*")
                out.append("\n")

                if 'children' in node and node['children']:
                    out.append("  Cabang-cabang:\n")
                    for child_label, child_lb, child_cost, child_red in node['children'][:6]:
                        out.append("  - " + child_label + ": LB = " + str(child_cost) + " + " + str(child_red) + " = " + str(child_lb) + "\n")

            out.append("\n")

        # d) Optimal solution
        out.append("*Biaya minimum:* " + str(trace['cost']) + "\n\n")
        route_str = " $arrow.r$ ".join(trace['route'])
        out.append("*Rute optimal:* " + route_str + "\n\n")

        out.append("*Jumlah node dievaluasi:* " + str(trace['nodes_explored']) + "\n\n")

        # Brute force comparison
        bf = math.factorial(n - 1)
        if n <= 8:
            out.append("*Perbandingan dengan Brute Force:*\n")
            out.append("- Brute Force: " + str(bf) + " kemungkinan rute\n")
            out.append("- Branch and Bound: " + str(trace['nodes_explored']) + " node dievaluasi\n")
            if bf > 0:
                savings = 100 * (1 - trace['nodes_explored'] / bf)
                out.append("- Penghematan: " + str(round(savings, 1)) + "%\n")
            out.append("\n")

        out.append("#pagebreak()\n\n")

    return "".join(out)


# ============================================================
# MAIN
# ============================================================

if __name__ == "__main__":
    print("Computing DP traces...")
    dp_traces = []
    for title, labels, mat in matrices_dp:
        dp_traces.append((title, held_karp_trace(mat, labels)))

    print("Computing BnB traces...")
    bnb_traces = []
    for title, labels, mat in matrices_bnb:
        bnb_traces.append((title, tsp_bnb_trace(mat, labels)))

    print("Generating Typst...")
    content = generate_typst(dp_traces, bnb_traces)

    output_path = "jawaban-latihan-asd.typ"
    with open(output_path, "w") as f:
        f.write(content)

    print(f"Written {len(content)} chars to {output_path}")

    # Summary
    for title, t in dp_traces:
        route_str = " → ".join(t['route'])
        print(f"  DP {title}: cost={t['cost']}, route={route_str}")
    for title, t in bnb_traces:
        route_str = " → ".join(t['route'])
        print(f"  BnB {title}: cost={t['cost']}, route={route_str}, nodes={t['nodes_explored']}")
