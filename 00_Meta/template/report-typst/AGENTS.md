# AGENTS.md - Typst Report Template

## Project Overview

This is a Typst template for academic lab reports at Universitas Gadjah Mada (UGM). The template provides a standardized format for writing practical course reports with proper academic styling.

### File Structure

```
.
├── main.typ          # Example template usage (edit this for your report)
├── template.typ      # Main template with reusable functions and styles
├── references.bib    # Bibliography file (BibTeX format)
├── PROMPT.md        # Prompt for AI agents (Indonesian)
├── SKILLS.md        # Skill definition for AI agents
├── USAGE.md         # User documentation (Indonesian)
├── AGENTS.md        # AI agent guidelines (this file)
└── assets/
    └── logo.png    # UGM logo for report header
```

---

## Build Commands

### Compiling the Document

```bash
# Using typst CLI (if installed)
typst compile main.typ
typst compile main.typ output.pdf

# Using typst CLI with watch mode (live preview)
typst watch main.typ

# Using VS Code extension
# Install "Typst LSP" and "Typst Preview" extensions, then use the preview feature
```

### Running a Single Test

This project does not have automated tests. To verify the template works:
1. Compile `main.typ` and check the output PDF
2. Verify that all sections render correctly (title page, TOC, figures, tables, bibliography)

### Linting

There is no dedicated linter for Typst. However:
- VS Code with Typst extension provides syntax highlighting and basic error checking
- The `typst` CLI will show compilation errors in the console

---

## MCP Tools Integration

This project integrates with MCP (Model Context Protocol) tools for enhanced AI agent capabilities:

### Typst Tools (`typst_*`)

| Tool | Usage | Description |
|------|-------|-------------|
| `typst_check_if_snippet_is_valid_typst_syntax` | Validate Typst code snippets | Check if generated Typst syntax is valid |
| `typst_check_if_snippets_are_valid_typst_syntax` | Batch validate multiple snippets | Validate multiple Typst code snippets |
| `typst_typst_snippet_to_image` | Render Typst to image | Preview Typst snippets as images |
| `typst_latex_snippet_to_typst` | Convert LaTeX to Typst | Convert LaTeX math/figures to Typst |
| `typst_latex_snippets_to_typst` | Batch convert LaTeX | Convert multiple LaTeX snippets |
| `typst_list_docs_chapters` | List Typst documentation | Get available docs chapters |
| `typst_get_docs_chapter` | Get Typst docs | Fetch specific documentation |

### Search & Reference Tools

| Tool | Usage | Description |
|------|-------|-------------|
| `codesearch` | Search code examples | Find relevant code patterns using Exa Code API |
| `websearch` | Web search | Search for references using Exa AI |
| `context7_resolve-library-id` | Resolve library ID | Get Context7 library ID for documentation |
| `context7_query-docs` | Query documentation | Fetch up-to-date docs for libraries/frameworks |

### Example Usage in AI Workflow

```python
# Validate generated code before writing
typst_check_if_snippet_is_valid_typst_syntax(
  typst_snippet='#code(lang: "python", ```print("test")```)'
)

# Convert LaTeX math to Typst
typst_latex_snippet_to_typst(
  latex_snippet='$E = mc^2$'
)

# Search for references
codesearch(
  query="python asyncio tutorial",
  tokensNum: 5000
)

# Get Typst documentation
context7_query_docs(
  libraryId="/typst/typst",
  query="how to create custom functions"
)
```

---

## Code Style Guidelines

### General Principles

1. **Follow the existing patterns** in `template.typ` and `main.typ`
2. **Keep functions focused** - each function should do one thing
3. **Use descriptive names** for variables and functions
4. **Maintain consistency** with the established code style
5. **Use helper functions** instead of raw Typst code when available

### File Organization

- `template.typ`: Contains reusable functions, styles, constants, and the main `report()` function
- `main.typ`: Contains the actual report content using the template
- `references.bib`: BibTeX bibliography entries

### Typst Syntax Conventions

#### Comments
```typst
// Single-line comment
#comment("Block comment")
```

#### Variable Declarations
```typst
// Use #let for variables and functions
#let author = "Name"
#let img(path, caption: none, width: 10cm) = { ... }
```

#### Function Parameters
- Use snake_case for parameter names: `course-code`, `font-size`, `show-table-of-content`
- Provide default values when appropriate
- Group related parameters together

#### Imports
```typst
// Local imports
#import "./template.typ": *

// Package imports (use @preview/ for community packages)
#import "@preview/numbly:0.1.0": numbly
```

#### Strings
- Use double quotes: `"text content"`
- Escape special characters with backslash: `"foo\"bar"`
- Use raw strings for code: ````rust code ``` `

#### Conditionals and Loops
```typst
if condition {
  ...
} else {
  ...
}

for item in array {
  ...
}
```

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Functions | snake_case | `report()`, `img()`, `code()`, `tbl()`, `col2()` |
| Variables | snake_case | `author`, `show-table-of-content` |
| Parameters | snake_case | `course-code`, `font-size`, `show-line-numbers` |
| File paths | kebab-case | `main.typ`, `template.typ` |
| Constants | prefix with `_` | `_const`, `_title-page()` |

---

## Helper Functions

The template provides several helper functions for common report elements:

### Image (`img`)
```typst
// With caption
#img("path/to/image.png", caption: "Deskripsi gambar", width: 10cm)

// Without caption (auto-numbering still works)
#img("path/to/image.png", width: 10cm)
```

### Code Block (`code`)
```typst
#code(
  lang: "python",
  caption: "Contoh kode Python",
  ```
  def hello():
      print("Hello, World!")
  ```
)

// Without caption
#code(lang: "python", ```print("test")```)

// Without line numbers
#code(lang: "python", show-line-numbers: false, ```code```)
```

### Table (`tbl`)
```typst
#tbl(
  caption: "Daftar perintah Git",
  columns: (auto, 1fr),
  [Perintah], [Fungsi],
  [git init], [Inisialisasi repo],
  [git add], [Tambah ke staging],
)

// Without caption
#tbl(
  columns: (auto, 1fr, 1fr),
  [A], [B], [C],
  [1], [2], [3],
)
```

### Equation (`eq`)
```typst
#eq($E = m c^2$, caption: "Relativitas", numbered: true)
#eq($E = m c^2$, numbered: true)  // Without caption
#eq($E = m c^2$)  // Without numbering
```

### Alert/Callout (`alert`)
```typst
#alert(type: "info", [Catatan info])
#alert(type: "warning", [Peringatan])
#alert(type: "error", [Error])
#alert(type: "success", [Berhasil])
```

### 2-Column Layout (`col2`)
```typst
#col2(
  [
    #img("image1.png", width: 5cm)
  ],
  [
    #img("image2.png", width: 5cm)
  ],
  gutter: 0.5cm,
)

#columns2(gutter: 1cm, [item1], [item2], [item3])
```

### Appendix (`appendix`)
```typst
#appendix(title: "Kode Sumber")[
  #code(lang: "python", ```full code```)
]

#appendix-section("Screenshots")
```

---

## Document Structure (main.typ)

Follow this order:
1. Template imports
2. Report configuration with `report.with()`
3. Heading settings
4. Content sections

```typst
#import "./template.typ": *
#import "@preview/numbly:0.1.0": numbly

#show: report.with(
  author: "Nama",
  id: "NIM",
  class: "B2",
  course: "Mata Kuliah",
  course-code: "KODE",
  lecturer: "Dosen",
  meeting: "1",
  title: "Judul",

  minimal: false,
  show-table-of-content: true,
  show-table-of-figure: true,
  show-table-of-table: true,
  show-bibliography: true,

  paper: "a4",
  font: "Times New Roman",
  font-size: 12pt,
  
  // New options
  add-indentation-every-paragraph: true,
  line-spacing: 1.5,
  heading-numbering-preset: "1.",
  show-page-number: false,
  page-number-position: "bottom-center",
  export-preset: "screen",
)

#set heading(numbering: numbly("{1:A}.", "{2}.", "{2}.{3}", "{2}.{3}.{4}"))

= Section Title

Content here...
```

### Report Configuration Options

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `author` | string | "Atalariq Barra Hadinugraha" | Author name |
| `id` | string | "25/557554/SV/26192" | Student ID (NIM) |
| `class` | string | "B2" | Class name |
| `course` | string | - | Course name |
| `course-code` | string | - | Course code |
| `lecturer` | string | - | Lecturer name |
| `meeting` | string | - | Meeting number |
| `title` | string | - | Report title |
| `minimal` | boolean | true | Use minimal title page |
| `show-table-of-content` | boolean | true | Show TOC |
| `show-table-of-figure` | boolean | true | Show figure list |
| `show-table-of-table` | boolean | true | Show table list |
| `show-bibliography` | boolean | true | Show bibliography |
| `paper` | string | "a4" | Paper size |
| `font-size` | length | 12pt | Font size |
| `font` | string | "New Computer Modern" | Font family |
| `code-font` | string | "Fira Code" | Code font family |
| `add-indentation-every-paragraph` | boolean | true | Indent each paragraph |
| `line-spacing` | number/string | 1.5 | Line spacing (1, 1.5, 2) |
| `heading-numbering-preset` | string | "1." | Heading number format |
| `show-page-number` | boolean | false | Show page numbers |
| `page-number-position` | string | "bottom-center" | Page number position |
| `export-preset` | string | "screen" | Export preset (screen/print) |

### Heading Numbering Presets

| Preset | Example Output |
|--------|---------------|
| `"1."` | 1. 2. 3. |
| `"I."` | I. II. III. |
| `"A."` | A. B. C. |
| `"1.1"` | 1.1 1.2 2.1 |
| `"1.1.1"` | 1.1.1 1.1.2 1.2.1 |

### Page Number Positions

- `"bottom-center"` - Bottom center
- `"bottom-left"` - Bottom left
- `"bottom-right"` - Bottom right
- `"top-center"` - Top center
- `"top-left"` - Top left
- `"top-right"` - Top right

---

## Content Guidelines

### Academic Writing (from PROMPT.md)
- Use formal Bahasa Indonesia
- Use passive voice for procedures
- Avoid casual language ("saya/kita")
- No hallucinations - verify all claims
- Use real references only (no fake citations)

### Bibliography
- Use BibTeX format in `references.bib`
- Cite with `@citekey` syntax
- Use IEEE style for citations

---

## Error Handling

Typst does not have traditional try-catch. To handle errors:
1. Validate required parameters in functions
2. Provide sensible defaults
3. Use conditional logic to handle missing optional parameters
4. Use `typst_check_if_snippet_is_valid_typst_syntax` to validate generated code

---

## Additional Resources

- [Typst Documentation](https://typst.app/docs/)
- [Typst Package Registry](https://typst.app/packages/)
- [BibTeX Entry Types](https://www.bibtex.com/e/entry-types)

---

## Notes for AI Agents

When generating reports using this template:
1. Follow the workflow in `PROMPT.md` (Phase 1 → Phase 2 → Phase 3)
2. Use `SKILLS.md` for skill-based agent workflows
3. Always verify references are real before including them
4. Use helper functions: `#img()`, `#code()`, `#tbl()`, `#eq()`, `#alert()`, `#col2()`, `#columns2()`, `#appendix()`
5. Use `numbly` for flexible heading numbering
6. Set `minimal: false` for full lab reports, `true` for simple homework
7. Use MCP tools to validate generated Typst code
8. Use `export-preset: "print"` when generating documents intended for physical printing
9. Caption parameters are now optional - set to `none` or omit for auto-numbering without caption text
