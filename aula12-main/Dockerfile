# syntax=docker/dockerfile:1.4

### Etapa 1: build
FROM alpine:3.20 AS builder

WORKDIR /src

RUN --mount=type=cache,target=/var/cache/apk \
    apk add --no-cache build-base

# Cria hello.c com múltiplas linhas corretamente
RUN printf '#include <stdio.h>\nint main() {\n  printf("Hello from a secure container!\\n");\n  return 0;\n}\n' > hello.c \
 && gcc hello.c -o myapp

### Etapa 2: imagem final mínima
FROM alpine:3.20 AS final

WORKDIR /app
COPY --from=builder /src/myapp .

CMD ["./myapp"]
