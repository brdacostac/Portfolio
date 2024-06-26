FROM public.ecr.aws/docker/library/node:lts-slim AS build
WORKDIR /portfolio

ADD . .
RUN npm install --legacy-peers --force && npm run build -- --base=/containers/brunoda_costa_cunha-portfolio/

FROM public.ecr.aws/docker/library/nginx:latest AS server

COPY --from=build /portfolio/dist /usr/share/nginx/html
