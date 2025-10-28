#!/usr/bin/env python3
"""
CSC 352 C Coding Standards Linter

This script checks C source files against the coding standards specified
in the CSC 352 course documentation.
"""

import os
import re
import sys
import argparse
import subprocess
from pathlib import Path
from typing import List, Tuple, Dict

class StyleViolation:
    def __init__(self, file_path: str, line_num: int, rule: str, message: str):
        self.file_path = file_path
        self.line_num = line_num
        self.rule = rule
        self.message = message
    
    def __str__(self):
        return f"{self.file_path}:{self.line_num}: {self.rule}: {self.message}"

class CSC352Linter:
    def __init__(self):
        self.violations = []
        self.checked_files = []
    
    def add_violation(self, file_path: str, line_num: int, rule: str, message: str):
        """Add a style violation to the list."""
        self.violations.append(StyleViolation(file_path, line_num, rule, message))
    
    def check_file_header(self, file_path: str, content: List[str]) -> None:
        """Check for required file header comment."""
        header_found = False
        file_name_found = False
        author_found = False
        purpose_found = False
        
        # Look for header comment in first 20 lines
        for i, line in enumerate(content[:20]):
            if '/*' in line:
                header_found = True
                # Check next several lines for required fields
                for j in range(i, min(i+15, len(content))):
                    if 'File:' in content[j] or 'file:' in content[j]:
                        file_name_found = True
                    if 'Author:' in content[j] or 'author:' in content[j]:
                        author_found = True
                    if 'Purpose:' in content[j] or 'purpose:' in content[j]:
                        purpose_found = True
                break
        
        if not header_found:
            self.add_violation(file_path, 1, "HEADER", 
                             "Missing file header comment")
        else:
            if not file_name_found:
                self.add_violation(file_path, 1, "HEADER", 
                                 "Header missing 'File:' field")
            if not author_found:
                self.add_violation(file_path, 1, "HEADER", 
                                 "Header missing 'Author:' field")
            if not purpose_found:
                self.add_violation(file_path, 1, "HEADER", 
                                 "Header missing 'Purpose:' field")
    
    def find_functions(self, content: List[str]) -> List[Tuple[int, str]]:
        """Find all function definitions (excluding main)."""
        functions = []
        in_comment = False
        
        for i, line in enumerate(content):
            # Track multi-line comments
            if '/*' in line:
                in_comment = True
            if '*/' in line:
                in_comment = False
                continue
            if in_comment or line.strip().startswith('//'):
                continue
            
            # Look for function definitions
            # Simple pattern: type name(params) { or type name(params)\n{
            func_pattern = r'^\s*\w+\s+(\w+)\s*\([^)]*\)\s*\{?'
            match = re.match(func_pattern, line.strip())
            
            if match:
                func_name = match.group(1)
                # Skip main function and common false positives
                if func_name not in ['main', 'if', 'while', 'for', 'switch']:
                    functions.append((i + 1, func_name))
        
        return functions
    
    def check_function_comments(self, file_path: str, content: List[str]) -> None:
        """Check that functions have proper documentation comments."""
        functions = self.find_functions(content)
        
        for line_num, func_name in functions:
            # Look for comment before function (within 10 lines)
            comment_found = False
            has_purpose = False
            has_params = False
            has_return = False
            
            start_search = max(0, line_num - 11)
            for i in range(start_search, line_num - 1):
                line = content[i].strip()
                if '/*' in line or line.startswith('*'):
                    comment_found = True
                    # Look for required elements in comment block
                    comment_block = content[i:line_num-1]
                    comment_text = ' '.join([l.strip() for l in comment_block]).lower()
                    
                    if func_name.lower() in comment_text:
                        has_purpose = True
                    if 'return' in comment_text or 'argument' in comment_text or 'param' in comment_text:
                        has_params = True
                        has_return = True
                    break
            
            if not comment_found:
                self.add_violation(file_path, line_num, "FUNCTION_DOC", 
                                 f"Function '{func_name}' missing documentation comment")
    
    def check_indentation(self, file_path: str, content: List[str]) -> None:
        """Check for consistent indentation."""
        brace_level = 0
        expected_indent = 0
        indent_size = None
        
        for i, line in enumerate(content):
            stripped = line.strip()
            if not stripped or stripped.startswith('//') or stripped.startswith('*'):
                continue
            
            # Calculate current indentation
            current_indent = len(line) - len(line.lstrip())
            
            # Determine indent size from first indented line
            if indent_size is None and current_indent > 0:
                indent_size = current_indent
            
            # Count braces to track nesting level
            open_braces = stripped.count('{')
            close_braces = stripped.count('}')
            
            # Check indentation (allowing some flexibility)
            if indent_size and current_indent > 0:
                if current_indent % indent_size != 0:
                    self.add_violation(file_path, i + 1, "INDENTATION", 
                                     f"Inconsistent indentation (expected multiple of {indent_size})")
            
            # Update brace level for next line
            if close_braces > 0:
                brace_level -= close_braces
            if open_braces > 0:
                brace_level += open_braces
    
    def check_header_guards(self, file_path: str, content: List[str]) -> None:
        """Check header files for include guards."""
        if not file_path.endswith('.h'):
            return
        
        has_ifndef = False
        has_define = False
        has_endif = False
        
        # Check first 10 lines for #ifndef
        for line in content[:10]:
            if line.strip().startswith('#ifndef'):
                has_ifndef = True
                break
        
        # Check for corresponding #define
        for line in content[:15]:
            if line.strip().startswith('#define') and has_ifndef:
                has_define = True
                break
        
        # Check last 10 lines for #endif
        for line in content[-10:]:
            if line.strip().startswith('#endif'):
                has_endif = True
                break
        
        if not (has_ifndef and has_define and has_endif):
            self.add_violation(file_path, 1, "HEADER_GUARD", 
                             "Header file missing proper include guards (#ifndef/#define/#endif)")
    
    def check_error_handling(self, file_path: str, content: List[str]) -> None:
        """Check for proper error handling of library calls."""
        risky_functions = ['malloc', 'fopen', 'fprintf', 'fscanf', 'fclose']
        
        for i, line in enumerate(content):
            for func in risky_functions:
                if func + '(' in line and '=' in line:
                    # Found assignment from risky function
                    # Look for error check in next few lines
                    error_check_found = False
                    for j in range(i + 1, min(i + 5, len(content))):
                        next_line = content[j].strip()
                        if ('if' in next_line and ('NULL' in next_line or '==' in next_line or '!=' in next_line)) or \
                           'perror' in next_line or 'fprintf(stderr' in next_line:
                            error_check_found = True
                            break
                    
                    if not error_check_found:
                        self.add_violation(file_path, i + 1, "ERROR_HANDLING", 
                                         f"Call to {func}() not checked for errors")
        
        # Check for fprintf/printf to stderr vs stdout
        for i, line in enumerate(content):
            if 'printf(' in line and 'error' in line.lower():
                if 'fprintf(stderr' not in line:
                    self.add_violation(file_path, i + 1, "ERROR_OUTPUT", 
                                     "Error message should be sent to stderr, not stdout")
    
    def check_compilation(self, file_path: str) -> None:
        """Test compilation with gcc -Wall."""
        if not file_path.endswith('.c'):
            return
        
        try:
            result = subprocess.run(['gcc', '-Wall', '-c', file_path, '-o', '/dev/null'], 
                                  capture_output=True, text=True)
            
            if result.returncode != 0:
                error_lines = result.stderr.strip().split('\n')
                for error_line in error_lines:
                    if error_line.strip():
                        self.add_violation(file_path, 0, "COMPILATION", 
                                         f"Compiler error/warning: {error_line}")
        except FileNotFoundError:
            self.add_violation(file_path, 0, "COMPILATION", 
                             "gcc not found - cannot test compilation")
    
    def lint_file(self, file_path: str) -> None:
        """Lint a single C source file."""
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.readlines()
            
            self.checked_files.append(file_path)
            
            # Run all checks
            self.check_file_header(file_path, content)
            self.check_function_comments(file_path, content)
            self.check_indentation(file_path, content)
            self.check_header_guards(file_path, content)
            self.check_error_handling(file_path, content)
            self.check_compilation(file_path)
            
        except Exception as e:
            self.add_violation(file_path, 0, "FILE_ERROR", f"Error reading file: {e}")
    
    def generate_report(self) -> str:
        """Generate a comprehensive report of all violations."""
        report = []
        report.append("=" * 60)
        report.append("CSC 352 Coding Standards Linter Report")
        report.append("=" * 60)
        report.append("")
        
        if not self.violations:
            report.append("✅ No style violations found!")
            report.append("")
            report.append(f"Files checked: {len(self.checked_files)}")
            for file_path in self.checked_files:
                report.append(f"  - {file_path}")
        else:
            # Group violations by type
            by_rule = {}
            for violation in self.violations:
                if violation.rule not in by_rule:
                    by_rule[violation.rule] = []
                by_rule[violation.rule].append(violation)
            
            report.append(f"❌ Found {len(self.violations)} style violations:")
            report.append("")
            
            for rule, rule_violations in by_rule.items():
                report.append(f"{rule} ({len(rule_violations)} violations):")
                for violation in rule_violations:
                    if violation.line_num > 0:
                        report.append(f"  {violation.file_path}:{violation.line_num} - {violation.message}")
                    else:
                        report.append(f"  {violation.file_path} - {violation.message}")
                report.append("")
        
        report.append("Coding Standards Reference:")
        report.append("- File header: name, author, purpose")
        report.append("- Function comments: purpose, args, return, assumptions")
        report.append("- Consistent indentation")
        report.append("- Header guards for .h files")
        report.append("- Error checking for library calls")
        report.append("- Error messages to stderr")
        report.append("- Compile with gcc -Wall (no warnings)")
        
        return "\n".join(report)

def main():
    parser = argparse.ArgumentParser(description='CSC 352 C Coding Standards Linter')
    parser.add_argument('files', nargs='*', help='C source files to lint')
    parser.add_argument('--dir', '-d', help='Directory to search for C files')
    parser.add_argument('--recursive', '-r', action='store_true', 
                       help='Recursively search directory')
    parser.add_argument('--output', '-o', help='Output report to file')
    
    args = parser.parse_args()
    
    linter = CSC352Linter()
    
    # Determine files to check
    files_to_check = []
    
    if args.dir:
        search_dir = Path(args.dir)
        if args.recursive:
            files_to_check.extend(search_dir.glob('**/*.c'))
            files_to_check.extend(search_dir.glob('**/*.h'))
        else:
            files_to_check.extend(search_dir.glob('*.c'))
            files_to_check.extend(search_dir.glob('*.h'))
    
    if args.files:
        files_to_check.extend([Path(f) for f in args.files])
    
    # If no files specified, check current directory
    if not files_to_check:
        current_dir = Path('.')
        files_to_check.extend(current_dir.glob('*.c'))
        files_to_check.extend(current_dir.glob('*.h'))
    
    # Convert to strings and remove duplicates
    files_to_check = list(set(str(f) for f in files_to_check if f.exists()))
    
    if not files_to_check:
        print("No C source files found to check.")
        return 1
    
    # Lint all files
    for file_path in files_to_check:
        linter.lint_file(file_path)
    
    # Generate and output report
    report = linter.generate_report()
    
    if args.output:
        with open(args.output, 'w') as f:
            f.write(report)
        print(f"Report written to {args.output}")
    else:
        print(report)
    
    # Return appropriate exit code
    return 1 if linter.violations else 0

if __name__ == '__main__':
    sys.exit(main())
