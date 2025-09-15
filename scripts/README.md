# CSC 352 C Coding Standards Linter

This linter checks your C code against the CSC 352 coding standards requirements.

## Features

The linter validates:

✅ **File Headers** - Ensures each file has a comment with:
- File name
- Author name  
- Purpose description

✅ **Function Documentation** - Verifies non-main functions have comments describing:
- What the function does
- Arguments and return values
- Assumptions made

✅ **Code Style**:
- Consistent indentation
- Header file include guards (#ifndef/#define/#endif)

✅ **Error Handling**:
- Library calls (malloc, fopen, etc.) are checked for errors
- Error messages go to stderr (not stdout)

✅ **Compilation**:
- Code compiles with `gcc -Wall` with no errors or warnings

## Usage

### Check current directory
```bash
./csc352_linter.py
```

### Check specific files
```bash
./csc352_linter.py file1.c file2.c header.h
```

### Check a directory
```bash
./csc352_linter.py --dir /path/to/project
```

### Check recursively
```bash
./csc352_linter.py --dir /path/to/project --recursive
```

### Save report to file
```bash
./csc352_linter.py --output report.txt
```

### Get help
```bash
./csc352_linter.py --help
```

## Example Output

```
============================================================
CSC 352 Coding Standards Linter Report
============================================================

❌ Found 3 style violations:

HEADER (2 violations):
  example.c:1 - Header missing 'Author:' field
  utils.c:1 - Missing file header comment

FUNCTION_DOC (1 violations):
  example.c:15 - Function 'calculate' missing documentation comment

Coding Standards Reference:
- File header: name, author, purpose
- Function comments: purpose, args, return, assumptions
- Consistent indentation
- Header guards for .h files
- Error checking for library calls
- Error messages to stderr
- Compile with gcc -Wall (no warnings)
```

## Integration Tips

1. **Run before submitting**: Use this linter before submitting any CSC 352 assignment
2. **IDE integration**: You can set up your editor to run this as a custom command
3. **Git hook**: Consider adding this as a pre-commit hook to catch issues early
4. **CI/CD**: Use in automated testing pipelines

## Troubleshooting

- **No files found**: Make sure you're in the right directory or specify files explicitly
- **Compilation errors**: The linter requires `gcc` to test compilation
- **Permission errors**: Make sure the script is executable (`chmod +x csc352_linter.py`)
