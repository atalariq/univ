#!/usr/bin/env python3
"""
Manim Searching Algorithm Visualizations - Unified Modular Scene
Linear -> Binary -> Interpolation Search
Fixed layout overlaps, dynamic status positioning, and cross-platform indentation.
"""

from manim import *
import numpy as np

# ── Config ───────────────────────────────────────────
config.pixel_width = 1920
config.pixel_height = 1080
config.frame_rate = 30
config.background_color = WHITE

# ── Color palette ────────────────────────────────────
ACCENT = "#ff8165"
TEXT_C = "#333333"
LABEL_C = "#888888"
CELL_FILL = "#f5f5f5"
CELL_STROKE = "#cccccc"
CURRENT_FILL = "#fff0e8"
CURRENT_STROKE = ACCENT
CHECKED_FILL = "#ffe8e8"
CHECKED_STROKE = "#d48888"
FOUND_FILL = "#e8ffe8"
FOUND_STROKE = "#4caf50"
RANGE_C = "#aaaaaa"
POINTER_C = ACCENT
CODE_BG = "#fafafa"
CODE_BORDER = "#e0e0e0"

# ── Data ─────────────────────────────────────────────
ARR = [2, 5, 8, 12, 16, 23, 38, 42, 56, 67, 78, 89, 95]
TARGET = 42

# ── Layout ───────────────────────────────────────────
TITLE_Y = 3.2
ARRAY_Y = 1.5
IDX_LABEL_Y = 0.6

# Indikator range dinaikkan tepat di bawah label indeks
BRACKET_Y = 0.1
BRACKET_LABEL_Y = -0.25
FOUND_Y = -1.2

# ── Cell size ────────────────────────────────────────
CELL_W = 0.80
CELL_H = 0.80
CELL_R = 0.10
CELL_SPACING = 0.90

# ═══════════════════════════════════════════════════════
# Helpers
# ═══════════════════════════════════════════════════════

def make_cell(value: int, font_size: float = 30) -> VGroup:
    box = RoundedRectangle(
        width=CELL_W, height=CELL_H, corner_radius=CELL_R,
        fill_color=CELL_FILL, fill_opacity=1,
        stroke_color=CELL_STROKE, stroke_width=2.5,
    )
    txt = Text(str(value), font="Monospace", font_size=font_size, color=TEXT_C)
    return VGroup(box, txt)

def build_array(arr: list) -> VGroup:
    cells = VGroup()
    for i, val in enumerate(arr):
        cell = make_cell(val)
        cell.shift(RIGHT * i * CELL_SPACING)
        cells.add(cell)
    cells.move_to(np.array([0, ARRAY_Y, 0]))
    return cells

def reset_array_colors(scene, cells, run_time=0.5):
    anims = []
    for cell in cells:
        box, txt = cell[0], cell[1]
        anims.append(box.animate.set_fill(CELL_FILL).set_stroke(CELL_STROKE, width=2.5))
        anims.append(txt.animate.set_color(TEXT_C))
    scene.play(*anims, run_time=run_time)

def box_of(cells: VGroup, i: int) -> RoundedRectangle:
    return cells[i][0]

def val_of(cells: VGroup, i: int) -> Text:
    return cells[i][1]

def idx_labels(cells: VGroup) -> VGroup:
    lbls = VGroup()
    for i in range(len(cells)):
        lbl = Text(f"[{i}]", font="Monospace", font_size=16, color=LABEL_C)
        lbl.move_to(np.array([cells[i].get_center()[0], IDX_LABEL_Y, 0]))
        lbls.add(lbl)
    return lbls

def flash_cell(scene, cells, i, run_time=0.4):
    scene.play(
        box_of(cells, i).animate.set_fill(CURRENT_FILL).set_stroke(CURRENT_STROKE, width=4),
        val_of(cells, i).animate.set_color(CURRENT_STROKE),
        run_time=run_time,
    )

def dim_cell(scene, cells, i, run_time=0.3):
    scene.play(
        box_of(cells, i).animate.set_fill(CHECKED_FILL).set_stroke(CHECKED_STROKE, width=2),
        val_of(cells, i).animate.set_color(LABEL_C),
        run_time=run_time,
    )

def found_cell(scene, cells, i, run_time=0.5):
    scene.play(
        box_of(cells, i).animate.set_fill(FOUND_FILL).set_stroke(FOUND_STROKE, width=5),
        val_of(cells, i).animate.set_color(FOUND_STROKE),
        run_time=run_time,
    )

def pointer_above(cells, i, label_text, color=POINTER_C) -> VGroup:
    tip = cells[i].get_top() + UP * 0.05
    base = tip + UP * 0.25
    arrow = Arrow(start=base, end=tip, color=color, stroke_width=3, buff=0, max_tip_length_to_length_ratio=0.3)
    lbl = Text(label_text, font="Monospace", font_size=16, color=color).next_to(arrow, UP, buff=0.05)
    return VGroup(arrow, lbl)

def bracket_below(cells, lo, hi, color=RANGE_C) -> VGroup:
    x0 = cells[lo].get_center()[0]
    x1 = cells[hi].get_center()[0]
    line = Line([x0, BRACKET_Y, 0], [x1, BRACKET_Y, 0], color=color, stroke_width=3)
    lt = Line([x0, BRACKET_Y - 0.08, 0], [x0, BRACKET_Y + 0.08, 0], color=color, stroke_width=3)
    rt = Line([x1, BRACKET_Y - 0.08, 0], [x1, BRACKET_Y + 0.08, 0], color=color, stroke_width=3)
    lbl = Text(f"[{lo} ... {hi}]", font="Monospace", font_size=18, color=color).move_to(np.array([(x0 + x1) / 2, BRACKET_LABEL_Y, 0]))
    return VGroup(line, lt, rt, lbl)

def make_title_scene(title_text, subtitle_text):
    title = Text(title_text, font="Monospace", font_size=42, color=ACCENT, weight=BOLD)
    subtitle = Text(subtitle_text, font="Monospace", font_size=21, color=LABEL_C)
    grp = VGroup(title, subtitle).arrange(DOWN, buff=0.15).move_to(np.array([0, TITLE_Y, 0]))
    return grp

class CodePanel:
    def __init__(self, lines: list, scene):
        self.scene = scene
        self.line_objs = VGroup()

        for line_text in lines:
            # Deteksi tingkat indentasi berdasarkan kelipatan 4 spasi awal
            leading_spaces = len(line_text) - len(line_text.lstrip(' '))
            indent_level = leading_spaces // 4
            clean_text = line_text.lstrip(' ')

            # Buat teks murni tanpa spasi indentasi awal
            txt_obj = Text(clean_text, font="Monospace", font_size=16, color=LABEL_C)

            # Geser objek teks ke kanan secara manual berdasarkan level indentasi
            if indent_level > 0:
                txt_obj.shift(RIGHT * indent_level * 0.45)

            self.line_objs.add(txt_obj)

        # Susun baris secara vertikal dengan meluruskan rata kiri (LEFT)
        self.line_objs.arrange(DOWN, aligned_edge=LEFT, buff=0.08)

        self.box = SurroundingRectangle(
            self.line_objs,
            corner_radius=0.12,
            color=CODE_BORDER,
            stroke_width=2,
            fill_color=CODE_BG,
            fill_opacity=0.95,
            buff=0.3
        )
        self.group = VGroup(self.box, self.line_objs).to_edge(DOWN, buff=0.4)

    def show(self, run_time=0.5):
        self.scene.play(FadeIn(self.group, shift=UP*0.2), run_time=run_time)

    def highlight(self, idx, run_time=0.35):
        anims = [
            ln.animate.set_color(ACCENT).set_weight(BOLD) if i == idx
            else ln.animate.set_color(LABEL_C).set_weight(NORMAL)
            for i, ln in enumerate(self.line_objs)
        ]
        self.scene.play(*anims, run_time=run_time)


# ═══════════════════════════════════════════════════════
# MAIN SCENE
# ═══════════════════════════════════════════════════════

class SearchAlgorithms(Scene):
    def construct(self):
        # ── Global UI Initial Setup ──
        self.cells = build_array(ARR)
        self.idx_lbls = idx_labels(self.cells)

        self.play(FadeIn(self.cells, shift=UP * 0.12), FadeIn(self.idx_lbls), run_time=1.0)
        self.wait(0.5)

        # 1. Linear Search
        self.run_linear_search()
        reset_array_colors(self, self.cells)
        self.wait(0.5)

        # 2. Binary Search
        self.run_binary_search()
        reset_array_colors(self, self.cells)
        self.wait(0.5)

        # 3. Interpolation Search
        self.run_interpolation_search()

    # ── 1. Linear Search ──
    def run_linear_search(self):
        title_grp = make_title_scene("Linear Search", f"Searching for target = {TARGET}")
        self.play(FadeIn(title_grp, shift=DOWN * 0.2), run_time=0.8)

        code = CodePanel([
            "function linearSearch(arr, n, x):",
            "    for i = 0 to n-1:",
            "        if arr[i] == x: return i",
            "    return -1",
        ], self)
        code.show()
        code.highlight(0)
        self.wait(0.4)

        status = Text("Starting linear search...", font="Monospace", font_size=20, color=TEXT_C)
        status.next_to(code.box, UP, buff=0.3)
        self.play(Write(status), run_time=0.4)

        comps = 0
        for i in range(len(ARR)):
            comps += 1
            code.highlight(1)

            ns = Text(f"Iteration {comps}: checking index [{i}]  →  arr[{i}] = {ARR[i]}", font="Monospace", font_size=20, color=TEXT_C)
            ns.next_to(code.box, UP, buff=0.3)
            self.play(Transform(status, ns), run_time=0.25)

            code.highlight(2)
            flash_cell(self, self.cells, i, run_time=0.45)

            if ARR[i] == TARGET:
                found_cell(self, self.cells, i)
                self.play(FadeOut(code.group), FadeOut(status), run_time=0.3)

                ft = Text(f"Found {TARGET} at index {i}!", font="Monospace", font_size=36, color=FOUND_STROKE, weight=BOLD).move_to(np.array([0, FOUND_Y, 0]))
                ct = Text(f"Total comparisons: {comps}", font="Monospace", font_size=22, color=LABEL_C).next_to(ft, DOWN, buff=0.15)
                res_group = VGroup(ft, ct)

                self.play(Write(ft), FadeIn(ct, shift=DOWN * 0.12), run_time=0.5)
                self.wait(2.5)
                break
            dim_cell(self, self.cells, i)

        self.play(FadeOut(res_group), FadeOut(title_grp), run_time=0.5)

    # ── 2. Binary Search ──
    def run_binary_search(self):
        title_grp = make_title_scene("Binary Search", f"Searching for target = {TARGET}  |  Sorted array")
        self.play(FadeIn(title_grp, shift=DOWN * 0.2), run_time=0.8)

        code = CodePanel([
            "function binarySearch(arr, lo, hi, x):",
            "    while lo <= hi:",
            "        mid = [(lo + hi) / 2]",
            "        if arr[mid] == x: return mid",
            "        else if arr[mid] < x: lo = mid+1",
            "        else: hi = mid-1",
            "    return -1",
        ], self)
        code.show()
        code.highlight(0)
        self.wait(0.3)

        status = Text("", font="Monospace", font_size=20, color=TEXT_C)
        status.next_to(code.box, UP, buff=0.3)
        self.add(status)

        lo, hi = 0, len(ARR) - 1
        step = 0

        while lo <= hi:
            mid = (lo + hi) // 2
            step += 1

            code.highlight(1)
            bracket = bracket_below(self.cells, lo, hi)
            mid_arr = pointer_above(self.cells, mid, "mid")
            self.play(Create(bracket), FadeIn(mid_arr), run_time=0.5)

            code.highlight(2)
            ns = Text(f"Step {step}  |  lo={lo}  mid={mid}  hi={hi}  |  arr[{mid}] = {ARR[mid]}", font="Monospace", font_size=20, color=TEXT_C)
            ns.next_to(code.box, UP, buff=0.3)
            self.play(Transform(status, ns), run_time=0.25)

            flash_cell(self, self.cells, mid, run_time=0.45)

            if ARR[mid] == TARGET:
                code.highlight(3)
                found_cell(self, self.cells, mid)
                self.play(FadeOut(bracket), FadeOut(mid_arr), FadeOut(status), FadeOut(code.group), run_time=0.35)

                ft = Text(f"Found {TARGET} at index {mid}!", font="Monospace", font_size=36, color=FOUND_STROKE, weight=BOLD).move_to(np.array([0, FOUND_Y, 0]))
                ct = Text(f"Total comparisons: {step}", font="Monospace", font_size=22, color=LABEL_C).next_to(ft, DOWN, buff=0.15)
                res_group = VGroup(ft, ct)

                self.play(Write(ft), FadeIn(ct, shift=DOWN * 0.12), run_time=0.5)
                self.wait(2.5)
                break

            elif ARR[mid] < TARGET:
                code.highlight(4)
                dim_cell(self, self.cells, mid)
                lo = mid + 1
            else:
                code.highlight(5)
                dim_cell(self, self.cells, mid)
                hi = mid - 1

            self.play(FadeOut(bracket), FadeOut(mid_arr), run_time=0.3)

        self.play(FadeOut(res_group), FadeOut(title_grp), run_time=0.5)

    # ── 3. Interpolation Search ──
    def run_interpolation_search(self):
        title_grp = make_title_scene("Interpolation Search", f"Searching for target = {TARGET}  |  Uniformly distributed data")
        self.play(FadeIn(title_grp, shift=DOWN * 0.2), run_time=0.8)

        code = CodePanel([
            "function interpSearch(arr, lo, hi, x):",
            "    while lo<=hi and arr[lo]<=x<=arr[hi]:",
            "        pos = lo + [(x-arr[lo])*(hi-lo) / (arr[hi]-arr[lo])]",
            "        if arr[pos] == x: return pos",
            "        else if arr[pos] < x: lo = pos+1",
            "        else: hi = pos-1",
            "    return -1",
        ], self)
        code.show()
        code.highlight(0)
        self.wait(0.3)

        status = Text("", font="Monospace", font_size=20, color=TEXT_C)
        status.next_to(code.box, UP, buff=0.3)
        self.add(status)

        lo, hi = 0, len(ARR) - 1
        step = 0

        while lo <= hi and ARR[lo] <= TARGET <= ARR[hi]:
            step += 1

            numerator = (TARGET - ARR[lo]) * (hi - lo)
            denominator = ARR[hi] - ARR[lo]
            pos = lo if denominator == 0 else lo + int(numerator / denominator)
            pos = max(lo, min(hi, pos))

            code.highlight(1)
            code.highlight(2)

            bracket = bracket_below(self.cells, lo, hi)
            self.play(Create(bracket), run_time=0.4)

            pa = pointer_above(self.cells, pos, "probe")
            self.play(FadeIn(pa), run_time=0.35)

            ns = Text(f"Step {step}  |  lo={lo}  hi={hi}  probe={pos}  |  arr[{pos}] = {ARR[pos]}", font="Monospace", font_size=20, color=TEXT_C)
            ns.next_to(code.box, UP, buff=0.3)
            self.play(Transform(status, ns), run_time=0.25)

            flash_cell(self, self.cells, pos, run_time=0.45)

            if ARR[pos] == TARGET:
                code.highlight(3)
                found_cell(self, self.cells, pos)
                self.play(FadeOut(bracket), FadeOut(pa), FadeOut(status), FadeOut(code.group), run_time=0.35)

                ft = Text(f"Found {TARGET} at index {pos}!", font="Monospace", font_size=36, color=FOUND_STROKE, weight=BOLD).move_to(np.array([0, FOUND_Y, 0]))
                ct = Text(f"Total comparisons: {step}", font="Monospace", font_size=22, color=LABEL_C).next_to(ft, DOWN, buff=0.15)
                res_group = VGroup(ft, ct)

                self.play(Write(ft), FadeIn(ct, shift=DOWN * 0.12), run_time=0.5)
                self.wait(4.0)
                return

            dim_cell(self, self.cells, pos)
            self.play(FadeOut(bracket), FadeOut(pa), run_time=0.3)

            if ARR[pos] < TARGET:
                code.highlight(4)
                lo = pos + 1
            else:
                code.highlight(5)
                hi = pos - 1

        self.play(FadeOut(res_group), FadeOut(title_grp), run_time=0.5)
