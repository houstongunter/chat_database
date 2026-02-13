# Chat App Database

PostgreSQL database schema for a chat application with user authentication.

## Database Structure

- **users**: User accounts with email and password hash
- **chats**: Chat sessions belonging to users
- **messages**: Individual messages within chats

## Prerequisites

- PostgreSQL installed ([Download](https://www.postgresql.org/download/))
- macOS: `brew install postgresql@16`

## Setup

1. Clone this repository
2. Run the setup script:
```bash
   ./setup.sh
```

3. Connect to the database:
```bash
   psql chat_app
```

## Manual Setup

If you prefer to run migrations manually:
```bash
createdb chat_app
psql chat_app < migrations/001_create_users.sql
psql chat_app < migrations/002_create_chats.sql
psql chat_app < migrations/003_create_messages.sql
```

## Schema Details

### users
- `id`: Primary key (auto-increment)
- `email`: Unique email address
- `password_hash`: Hashed password
- `created_at`: Timestamp

### chats
- `id`: Primary key (auto-increment)
- `user_id`: Foreign key to users
- `title`: Chat title
- `created_at`: Timestamp

### messages
- `id`: Primary key (auto-increment)
- `chat_id`: Foreign key to chats
- `role`: Message role (user/assistant)
- `content`: Message content
- `created_at`: Timestamp

## Reset Database

To start fresh:
```bash
dropdb chat_app
./setup.sh
```