# Data Model

> [[ERD.md]]

Ada `Admin` yang bisa mengelola:
- `Product`
  - `photos`
    - `imageUri`
    - `imageDescription` (for a11ty)
  - `title`
  - `description`
  - `category_id`
  - `package_id`
  - `hidden?` (default: true)
- `Category`
  - `title`
- `Package`
  - `title`
  - `description`
  - `imageUri?`
- `Portfolio`
  - `title`
  - `fileUri`
  - `hidden?`
- `Testimony`
  - `content`
  - `upvote_count`
  - `hidden?` (default: true)
  - `upvote()` (reference: <https://www.joshwcomeau.com/>)
- `Faq`
  - `question` (bentuknya form dari sisi client) #need-to-discuss
  - `answer` (bentuknya form dari sisi admin) #need-to-discuss
  - `status?` : `pending`, `approved`, `rejected`
- `Contact`
  - `address`
  - `phone`
  - `email`
  - `links?` (mandatory: placeholder for IG)

