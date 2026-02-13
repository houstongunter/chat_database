#!/bin/bash

DB_NAME="storing_chats"

echo "Creating database: $DB_NAME"
createdb $DB_NAME 2>/dev/null || echo "Database already exists"

echo "Running migrations..."
psql $DB_NAME < migrations/001_create_users.sql
psql $DB_NAME < migrations/002_create_chats.sql
psql $DB_NAME < migrations/003_create_messages.sql

echo "✅ Database setup complete!"
echo "Connect with: psql $DB_NAME"