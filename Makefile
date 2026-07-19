COMPOSE = docker compose

.PHONY: up down restart logs ps stats tunnel-up tunnel-down check test

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) --profile tunnel down

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs -f --tail=100

ps:
	$(COMPOSE) ps

stats:
	docker stats

tunnel-up:
	$(COMPOSE) --profile tunnel up -d

tunnel-down:
	$(COMPOSE) --profile tunnel down cloudflared

check:
	$(COMPOSE) config -q
	$(COMPOSE) run --rm --no-deps web nginx -t