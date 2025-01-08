# Insufficient Error Handling in Asynchronous Dart Operations

This repository demonstrates a common error in Dart:  lack of robust error handling in asynchronous operations using `http` package.  The `bug.dart` file shows the problematic code, while `bugSolution.dart` provides a more resilient solution.

## Problem

The original code lacks specific error handling for HTTP status codes other than 200. It also doesn't provide specific handling for the type of exception that occurred during the API call.

## Solution

The solution in `bugSolution.dart` improves error handling by:

1. Checking the HTTP status code and handling non-200 responses appropriately.
2. Implementing more robust error handling using `on` clauses to catch specific exceptions.
3. Logging useful error information.
4. Using a more specific exception type that is more informative than a generic Exception.