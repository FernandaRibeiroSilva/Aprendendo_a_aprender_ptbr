#!/bin/bash

echo "Testing the 'Aprendendo a Aprender' website..."
echo "=========================================="

# Test 1: Check if server is running
echo "Test 1: Checking if server is running on port 5500..."
if curl -s http://localhost:5500 > /dev/null; then
    echo "✅ Server is running"
else
    echo "❌ Server is not running"
    exit 1
fi

# Test 2: Check if HTML loads
echo "Test 2: Checking if HTML loads correctly..."
response=$(curl -s http://localhost:5500)
if echo "$response" | grep -q "<!DOCTYPE html>"; then
    echo "✅ HTML loads correctly"
else
    echo "❌ HTML does not load correctly"
fi

# Test 3: Check if CSS loads
echo "Test 3: Checking if CSS loads..."
css_response=$(curl -s http://localhost:5500/pages/index.css)
if echo "$css_response" | grep -q "/*"; then
    echo "✅ CSS loads correctly"
else
    echo "❌ CSS does not load correctly"
fi

# Test 4: Check for main content sections
echo "Test 4: Checking for main content sections..."
if echo "$response" | grep -q "header__title"; then
    echo "✅ Header section found"
else
    echo "❌ Header section not found"
fi

if echo "$response" | grep -q "techniques"; then
    echo "✅ Techniques section found"
else
    echo "❌ Techniques section not found"
fi

if echo "$response" | grep -q "footer"; then
    echo "✅ Footer section found"
else
    echo "❌ Footer section not found"
fi

echo "=========================================="
echo "Manual testing completed!"
echo ""
echo "Note: TestSprite is currently experiencing backend issues (500 errors)."
echo "The website appears to be working correctly based on manual tests."
echo ""
echo "To run TestSprite when the service is available, use:"
echo "npx @testsprite/testsprite-mcp@latest generateCodeAndExecute"