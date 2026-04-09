# Individual Development Plan (IDP)

Spec-driven monorepo for an Individual Development Plan application. The backend is a Sinatra API with SQLite; React web and mobile clients are defined in the specs and will live under `web/` and `mobile/` when scaffolded.

## Prerequisites

- **Ruby** 3.2 or newer (recommended) with [Bundler](https://bundler.io/)
- **Node.js** 18+ and npm (only needed after `web/` and `mobile/` exist)

## Run the API locally

From the repository root:

1. **Install Ruby dependencies**

   ```bash
   cd api && bundle install && cd ..
   ```

2. **Create the database and run migrations**

   ```bash
   make db-setup
   ```

   Equivalent: `cd api && bundle exec rake db:create db:migrate`

3. **Start the server**

   ```bash
   make server
   ```

   Equivalent: `cd api && bundle exec puma`

   By default Puma listens on **http://127.0.0.1:9292** (check the terminal output if your environment sets `PORT`).

4. **Smoke test**

   ```bash
   curl -s http://127.0.0.1:9292/health
   ```

   You should see JSON like `{"status":"ok"}`.

## Full monorepo setup (when `web/` and `mobile/` exist)

```bash
make setup    # bundle install + npm install in api, web, mobile
make db-setup
```

Then run the API with `make server` and the web dev server with `make web` (Vite or similar, per `web/package.json`).

## Development commands

| Command        | Description                                      |
| -------------- | ------------------------------------------------ |
| `make server`  | Run the Sinatra API (Puma)                       |
| `make db-migrate` | Apply pending ActiveRecord migrations         |
| `make test`    | Run API tests (`rspec` in `api/`)                |
| `make check`   | Lint API (RuboCop) and, when present, web/mobile |

## Project layout

- `api/` — Sinatra app (`app.rb`, `config.ru`, ActiveRecord + SQLite)
- `specs/` — Product and technical specifications
- `Makefile` — Common tasks from the repo root

For agent and spec workflow, see `AGENTS.md` and `specs/README.md`.
