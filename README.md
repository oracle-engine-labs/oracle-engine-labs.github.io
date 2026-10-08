# Oracle Engine Labs — website

Static single-page site. No build step, no dependencies.

- `index.html` — the entire site
- `.nojekyll` — tells GitHub Pages to serve files as-is
- `CNAME` — custom domain (delete this file until you own a domain)

## Deploy (GitHub Pages)

1. Create a GitHub **organization** named `oracle-engine-labs`.
2. Inside it, create a **public** repo named `oracle-engine-labs.github.io`.
3. Push this folder to it (see `deploy.sh`).
4. Settings -> Pages -> Source: *Deploy from a branch*, branch `main`, folder `/ (root)`.
5. Live at https://oracle-engine-labs.github.io within a few minutes.

## Custom domain

Buy the domain, then:
- Put the bare domain in a `CNAME` file (e.g. `oracleenginelabs.com`)
- At your registrar, add four A records for the apex pointing at
  185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153
- Add a CNAME record for `www` -> `oracle-engine-labs.github.io`
- Settings -> Pages -> Custom domain, then tick "Enforce HTTPS"
