# Work List

<!--
Single execution queue for all work — spec implementations, audit findings, and promoted review items.

HOW IT WORKS:

1. Pick an unblocked item (no `(blocked: ...)` annotation)
2. Implement it
3. Validate cross-file dependencies
4. Move the completed item from this file to specd_history.md
5. Check this file for items whose `(blocked: ...)` annotation references the
   work you just completed — remove the annotation to unblock them
6. Delete the spec header in this file if no more items are under it
7. LOOP_COMPLETE when this file has no unblocked items remaining

POPULATED BY: /specd:audit command, /specd:review-intake command, and humans during spec phase.
-->

---

## project-setup v0.1

- [ ] Set up Sinatra app with modular style (Gemfile, config.ru, app.rb, Puma)
- [ ] Configure SQLite with ActiveRecord and sinatra-activerecord (database.yml, Rakefile with db tasks)
- [ ] Add rack-cors middleware for frontend dev servers
- [ ] Implement JSON API response helpers (success/error wrappers, content-type)
- [ ] Implement GET /health endpoint
- [ ] Scaffold React web app with Vite + TypeScript + React Router
- [ ] Scaffold mobile app with Expo + React Native
- [ ] Create shared API client config in web and mobile pointing to localhost backend
- [ ] Set up RSpec with rack-test for API testing
- [ ] Set up Rubocop for API and ESLint for web/mobile
- [ ] Write top-level Makefile targets (setup, db-setup, db-migrate, server, web, test, check)

## authentication v0.1

- [ ] Create users table migration (blocked: SQLite + ActiveRecord setup)
- [ ] Create refresh_tokens table migration (blocked: users table)
- [ ] Implement User model with validations
- [ ] Set up OmniAuth with Google and GitHub strategies (blocked: Sinatra app setup)
- [ ] Implement OAuth callback handler — find or create user, issue tokens
- [ ] Implement JWT token generation and verification (access tokens)
- [ ] Implement refresh token generation with BCrypt hashing
- [ ] Implement POST /auth/refresh endpoint
- [ ] Implement authentication before filter for /api/* routes (current_user)
- [ ] Implement GET /api/me endpoint
- [ ] Implement DELETE /auth/sign_out endpoint
- [ ] Add auth integration tests (blocked: RSpec setup)

## goals-management v0.1

- [ ] Create areas table migration (blocked: users table)
- [ ] Create goals table migration (blocked: areas table)
- [ ] Create skills table migration (blocked: goals table)
- [ ] Create actions table migration (blocked: skills table)
- [ ] Implement Area model with validations and user scoping
- [ ] Implement Goal model with validations, status enum, user scoping
- [ ] Implement Skill model with validations and user scoping
- [ ] Implement Action model with validations, frequency handling, user scoping
- [ ] Implement areas CRUD endpoints (GET index, POST create, GET show with nested goals, PATCH update, DELETE with cascade, PATCH reorder)
- [ ] Implement goals CRUD endpoints (GET index, POST create, GET show with nested skills, PATCH update, DELETE with cascade)
- [ ] Implement skills CRUD endpoints (GET index, POST create, PATCH update, DELETE with cascade)
- [ ] Implement actions CRUD endpoints (GET index, POST create, PATCH update, DELETE)
- [ ] Add goals-management integration tests (blocked: auth before filter)

## progress-tracking v0.1

- [ ] Create action_logs table migration (blocked: actions table)
- [ ] Create reflections table migration (blocked: goals table)
- [ ] Implement ActionLog model with validations and unique daily constraint
- [ ] Implement Reflection model with validations
- [ ] Implement POST /api/actions/:action_id/logs endpoint
- [ ] Implement DELETE /api/action_logs/:id endpoint
- [ ] Implement GET /api/actions/:action_id/logs with cursor pagination
- [ ] Implement streak calculation logic (daily, weekly, monthly)
- [ ] Implement completion percentage calculation (per action, skill, goal)
- [ ] Implement GET /api/goals/:goal_id/progress endpoint
- [ ] Implement GET /api/actions/:action_id/streak endpoint
- [ ] Implement GET /api/dashboard endpoint (active goals, today's actions, top streaks)
- [ ] Implement GET /api/actions/:action_id/chart endpoint with period and range params
- [ ] Implement GET /api/goals/:goal_id/chart endpoint
- [ ] Implement reflections CRUD endpoints (POST, GET paginated, PATCH, DELETE)
- [ ] Add progress-tracking integration tests (blocked: goals-management endpoints)

## review-cycles v0.1

- [ ] Create review_schedules table migration (blocked: users table)
- [ ] Create reviews table migration (blocked: users table)
- [ ] Create review_goal_snapshots table migration (blocked: reviews table, goals table)
- [ ] Implement ReviewSchedule model — auto-create on user creation with defaults
- [ ] Implement Review model with validations (draft/completed status)
- [ ] Implement ReviewGoalSnapshot model
- [ ] Implement GET /api/review_schedule endpoint (with is_due and days_until_due)
- [ ] Implement PATCH /api/review_schedule endpoint
- [ ] Implement POST /api/reviews endpoint — create draft with pre-populated goal snapshots
- [ ] Implement GET /api/reviews (paginated) and GET /api/reviews/:id endpoints
- [ ] Implement PATCH /api/reviews/:id endpoint (draft only)
- [ ] Implement POST /api/reviews/:id/complete — finalize, snapshot, advance next_review_at
- [ ] Add review-cycles integration tests (blocked: goals-management endpoints, progress-tracking)

---
