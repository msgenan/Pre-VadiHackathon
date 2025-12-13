#!/bin/sh
set -e

echo "▶️ Backend tests (pytest)"
pytest /backend/tests

echo "▶️ Frontend tests (jest)"
cd /frontend
npm test -- --ci --passWithNoTests

echo "▶️ API tests (Newman)"
newman run /tests/postman/collection.json \
  --env-var base_url=http://backend:8000

echo "✅ ALL TESTS PASSED"
