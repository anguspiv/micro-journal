#!/bin/bash

# Pre-commit hook for Rust project
# This hook runs before each commit to ensure code quality

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔧 Running pre-commit checks...${NC}"

# Check if we're in a Rust project
if [ ! -f "core/Cargo.toml" ]; then
    echo -e "${RED}❌ Not in a Rust project root (core/Cargo.toml not found)${NC}"
    exit 1
fi

cd core

# Track if we made any automatic fixes
MADE_FIXES=false

echo -e "${BLUE}📝 Checking code formatting...${NC}"

# Check if rustfmt would make changes
if ! cargo fmt --check > /dev/null 2>&1; then
    echo -e "${YELLOW}🔧 Auto-fixing code formatting...${NC}"
    cargo fmt

    # Add formatted files to staging area
    git add -u .
    MADE_FIXES=true
    echo -e "${GREEN}✅ Code formatting fixed and staged${NC}"
else
    echo -e "${GREEN}✅ Code formatting is correct${NC}"
fi

echo -e "${BLUE}🔍 Running Clippy lints...${NC}"

# Run clippy and capture output
if ! CLIPPY_OUTPUT=$(cargo clippy --all-targets --all-features -- -D warnings 2>&1); then
    echo -e "${RED}❌ Clippy found issues:${NC}"
    echo "$CLIPPY_OUTPUT"

    # Try to auto-fix some clippy issues
    echo -e "${YELLOW}🔧 Attempting to auto-fix clippy issues...${NC}"

    if cargo clippy --fix --allow-staged --allow-dirty --all-targets --all-features -- -D warnings > /dev/null 2>&1; then
        echo -e "${GREEN}✅ Some clippy issues were auto-fixed${NC}"

        # Add fixed files to staging area
        git add -u .
        MADE_FIXES=true

        # Run clippy again to check if all issues are resolved
        if cargo clippy --all-targets --all-features -- -D warnings > /dev/null 2>&1; then
            echo -e "${GREEN}✅ All clippy issues resolved${NC}"
        else
            echo -e "${RED}❌ Some clippy issues require manual fixing:${NC}"
            cargo clippy --all-targets --all-features -- -D warnings
            echo -e "${RED}Please fix the above issues and commit again${NC}"
            exit 1
        fi
    else
        echo -e "${RED}❌ Clippy issues require manual fixing:${NC}"
        echo "$CLIPPY_OUTPUT"
        echo -e "${RED}Please fix the above issues and commit again${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}✅ Clippy checks passed${NC}"
fi

echo -e "${BLUE}🏗️ Checking if code compiles...${NC}"

# Check compilation
if ! cargo check > /dev/null 2>&1; then
    echo -e "${RED}❌ Code does not compile:${NC}"
    cargo check
    echo -e "${RED}Please fix compilation errors and commit again${NC}"
    exit 1
else
    echo -e "${GREEN}✅ Code compiles successfully${NC}"
fi

echo -e "${BLUE}🧪 Running tests...${NC}"

# Run tests
if ! cargo test > /dev/null 2>&1; then
    echo -e "${RED}❌ Tests failed:${NC}"
    cargo test
    echo -e "${RED}Please fix failing tests and commit again${NC}"
    exit 1
else
    echo -e "${GREEN}✅ All tests passed${NC}"
fi

# Go back to project root for final message
cd ..

if [ "$MADE_FIXES" = true ]; then
    echo -e "${GREEN}🎉 Pre-commit checks completed with auto-fixes applied!${NC}"
    echo -e "${YELLOW}📝 Note: Auto-fixes have been added to this commit${NC}"
else
    echo -e "${GREEN}🎉 All pre-commit checks passed!${NC}"
fi

echo -e "${BLUE}📋 Commit proceeding...${NC}"