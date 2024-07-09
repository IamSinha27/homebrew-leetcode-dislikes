
---

# Homebrew Tap: leetcode-dislikes

## Overview

Since LeetCode stopped displaying the number of dislikes for questions, this Homebrew tap provides a convenient way to view the dislikes count for any LeetCode problem directly in your terminal on macOS.

## Installation

To install `leetcode-dislikes` using Homebrew, follow these steps:

1. **Tap into the Repository:**

   ```bash
   brew tap IamSinha27/leetcode-dislikes
   ```

2. **Install the Formula:**

   ```bash
   brew install leetcode-dislikes
   ```

## Usage

Once installed, you can use `leetcode-dislikes` to fetch the dislikes count for a specific LeetCode problem.

### Syntax

```bash
leetcode-dislikes {problem-name}
```

- Replace `{problem-name}` with the title slug of the LeetCode problem.
- Ensure the problem name is in lowercase.
- If the problem name on LeetCode contains spaces, replace the spaces with hyphens (`-`). For example, `Two Sum` should be written as `two-sum`.

### Example

To fetch the dislikes count for the LeetCode problem "Two Sum":

```bash
leetcode-dislikes two-sum
```

This will display the number of dislikes for the problem "Two Sum" directly in your terminal.

---

