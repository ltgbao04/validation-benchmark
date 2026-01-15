#!/bin/bash

# Script to deploy all XBEN benchmarks
# Usage: ./deploy_all.sh

echo "=========================================="
echo "Deploying all XBEN benchmarks..."
echo "=========================================="

# Change to the validation-benchmarks directory
cd "$(dirname "$0")"

# Counter for tracking
SUCCESS=0
FAILED=0

# Loop through all benchmarks (001 to 104)
for i in {1..104}; do
    # Format number with leading zeros (001, 002, ..., 104)
    BENCHMARK=$(printf "XBEN-%03d-24" $i)
    
    echo ""
    echo "=========================================="
    echo "[$i/104] Deploying $BENCHMARK..."
    echo "=========================================="
    
    # Run the make command
    if make run BENCHMARK=$BENCHMARK; then
        echo "✓ $BENCHMARK deployed successfully on port 10$(printf "%02d" $i)"
        ((SUCCESS++))
    else
        echo "✗ $BENCHMARK failed to deploy"
        ((FAILED++))
    fi
done

echo ""
echo "=========================================="
echo "Deployment Summary"
echo "=========================================="
echo "✓ Successfully deployed: $SUCCESS"
echo "✗ Failed to deploy: $FAILED"
echo "Total benchmarks: 104"
echo "=========================================="
