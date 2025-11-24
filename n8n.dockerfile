version: '3.8'

services:
  # --- n8n Service ---
  n8n:
    image: n8nio/n8n
    restart: always
    ports:
      - "5678:5678"
    environment:
      # General Configuration
      # REPLACE WITH YOUR ACTUAL DOMAIN AND SUBDOMAIN
      - N8N_HOST=n8n.aevra.dev 
      - N8N_PORT=5678
      - N8N_PROTOCOL=http
      - WEBHOOK_URL=http://n8n.aevra.dev
      - TZ=Australia/Perth # Set your timezone

      # Database Configuration (PostgreSQL)
      - DB_TYPE=postgres
      - DB_POSTGRES_HOST=postgres
      - DB_POSTGRES_PORT=5432
      # REPLACE WITH YOUR CHOSEN DB NAME
      - DB_POSTGRES_DATABASE=n8n_database 
      # REPLACE WITH YOUR CHOSEN DB USER
      - DB_POSTGRES_USER=n8n_db_user 
      # REPLACE WITH A STRONG PASSWORD
      - DB_POSTGRES_PASSWORD=Fxz@4574896523 

      # Authentication 
      - N8N_BASIC_AUTH_ACTIVE=true
      # REPLACE WITH YOUR CHOSEN ADMIN USER
      - N8N_USER=adminuser 
      # REPLACE WITH A STRONG PASSWORD
      - N8N_PASSWORD=Fxz@4574896523 
      
    volumes:
      - n8n_data:/home/node/.n8n
    depends_on:
      - postgres

  # --- PostgreSQL Database Service ---
  postgres:
    image: postgres:15
    restart: always
    environment:
      # MUST MATCH n8n SERVICE CONFIGURATION ABOVE
      - POSTGRES_USER=n8n_db_user 
      - POSTGRES_PASSWORD=Fxz@4574896523 
      - POSTGRES_DB=n8n_database 
    volumes:
      - postgres_data:/var/lib/postgresql/data

# --- Volumes ---
volumes:
  n8n_data:
  postgres_data:
