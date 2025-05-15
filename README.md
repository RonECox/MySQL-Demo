# MySQL Demo: Codespaces + Docker + Data Import

This project demonstrates how to run a MySQL server inside a GitHub Codespace using Docker-in-Docker (DinD), and how to automatically set up a database, create a table, and import data from a CSV file.

## Watch the Video Tutorial
[![Watch the Video Tutorial](https://img.youtube.com/vi/jcj-b7tqCKY/0.jpg)](https://youtu.be/jcj-b7tqCKY)
---

## 🧰 Features

- ⚙️ **Fully containerized MySQL 8.0** instance
- 📦 **GitHub Codespaces-compatible** via `.devcontainer` setup
- 🛠️ Automatic **database and table creation** from `db_setup.sql`
- 📥 Post-start **CSV data import** using `LOAD DATA LOCAL INFILE`
- 🐚 Custom `import_data.sh` handles robust, timed data ingestion

---

## 📁 Project Structure

```plaintext
MYSQL-DEMO/
├── .devcontainer/
│   ├── Dockerfile               # Base Codespace image setup
│   └── devcontainer.json        # Codespace + Docker-in-Docker config
├── db_setup.sql                 # Creates DB and table (excluding CSV load)
├── mydrivers.csv                # Driver metadata for import
├── import_data.sh               # Script to run data import after container boot
├── docker-compose.yml          # Runs MySQL and sets server options
├── devcontainer.json            # Legacy/alternative config (can delete if unused)
└── Dockerfile.txt               # Legacy/alternative Dockerfile (consider renaming)
```

---

## 🚀 Getting Started

### 1. Open in GitHub Codespaces

Click the green **"Code"** button on GitHub and select **"Open with Codespaces"**.

> Ensure Docker-in-Docker is enabled by the `.devcontainer.json`.

### 2. Wait for Environment to Build

The container setup will:
- Install Docker
- Launch MySQL via Docker Compose
- Create `MyDriversDB` and `drivers` table via `db_setup.sql`
- Auto-run `import_data.sh` to load `mydrivers.csv` into the database

### 3. Connect to MySQL

Use the terminal or a MySQL client:

```bash
mysql -h 127.0.0.1 -u user -ppassword
```

Then:

```sql
USE MyDriversDB;
SELECT * FROM drivers LIMIT 10;
```

---

## 🧪 CSV Format

Ensure the first line contains headers:

```csv
channel,version,revision,binary_type,platform,url,http_status
stable,136.0.7103.92,r1440670,chrome,linux64,https://...,200
...
```

Note: The `id` field is auto-incremented and **excluded** from the CSV.

---

## 🛠️ Development Notes

- `LOAD DATA LOCAL INFILE` must be run **after container startup** due to MySQL entrypoint restrictions.
- The `import_data.sh` script waits for MySQL to become available, then imports the data using the `--local-infile=1` flag.
- All MySQL volumes are temporary unless you modify `docker-compose.yml` to persist them.

---

## 🧼 Cleanup

To reset the environment (including clearing data):

```bash
docker compose down -v
docker compose up -d
```

---

## 📜 License

This project is provided for demo and instructional purposes and is licensed under the [MIT License](LICENSE)

---

## 🙋‍♂️ Support

Have questions or suggestions? Open an [issue](https://github.com/RonECox/MySQL-Demo/issues) or submit a pull request!
