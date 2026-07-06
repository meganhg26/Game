#!/bin/zsh
set -uo pipefail

mkdir -p logos
failures=()

download_url() {
  local url="$1"
  local file="$2"
  curl -L --fail --silent --show-error "$url" -o "$file"
}

download_wikipedia_logo() {
  local url="$1"
  local file="$2"
  echo "Downloading $file from Wikipedia/Wikimedia"
  if download_url "$url" "$file"; then
    return 0
  fi
  echo "Could not download Wikipedia logo for $file" >&2
  failures+=("wikipedia -> $file")
  return 0
}

download_company_logo() {
  local domain="$1"
  local file="$2"
  local clearbit_url="https://logo.clearbit.com/${domain}"
  local google_url="https://www.google.com/s2/favicons?sz=256&domain_url=https://${domain}"
  local yandex_url="https://favicon.yandex.net/favicon/${domain}?size=256"

  echo "Downloading $file from $domain"
  if download_url "$clearbit_url" "$file"; then
    return 0
  fi

  echo "Clearbit failed for $domain, trying Google favicon"
  if download_url "$google_url" "$file"; then
    return 0
  fi

  echo "Google failed for $domain, trying Yandex favicon"
  if download_url "$yandex_url" "$file"; then
    return 0
  fi

  echo "Could not download $domain" >&2
  failures+=("$domain -> $file")
  return 0
}

download_company_logo "apple.com" "logos/01-apple.png"
download_company_logo "nvidia.com" "logos/02-nvidia.png"
download_company_logo "microsoft.com" "logos/03-microsoft.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Alphabet_Inc_Logo_2015.svg/330px-Alphabet_Inc_Logo_2015.svg.png" "logos/04-alphabet.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Amazon_2024.svg/250px-Amazon_2024.svg.png" "logos/05-amazon.png"
download_company_logo "aramco.com" "logos/06-saudi-aramco.png"
download_company_logo "meta.com" "logos/07-meta.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Berkshire_Hathaway.svg/250px-Berkshire_Hathaway.svg.png" "logos/08-berkshire-hathaway.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/en/thumb/6/63/Tsmc.svg/250px-Tsmc.svg.png" "logos/09-tsmc.png"
download_company_logo "lilly.com" "logos/10-eli-lilly.png"
download_company_logo "broadcom.com" "logos/11-broadcom.png"
download_company_logo "tesla.com" "logos/12-tesla.png"
download_company_logo "jpmorganchase.com" "logos/13-jpmorgan-chase.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Walmart_logo_%282025%29.svg/250px-Walmart_logo_%282025%29.svg.png" "logos/14-walmart.png"
download_company_logo "novonordisk.com" "logos/15-novo-nordisk.png"
download_company_logo "unitedhealthgroup.com" "logos/16-unitedhealth-group.png"
download_company_logo "exxonmobil.com" "logos/17-exxonmobil.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Visa_Inc._logo_%282021%E2%80%93present%29.svg/250px-Visa_Inc._logo_%282021%E2%80%93present%29.svg.png" "logos/18-visa.png"
download_company_logo "tencent.com" "logos/19-tencent.png"
download_company_logo "mastercard.com" "logos/20-mastercard.png"
download_company_logo "pg.com" "logos/21-pg.png"
download_company_logo "jnj.com" "logos/22-johnson-johnson.png"
download_company_logo "costco.com" "logos/23-costco.png"
download_company_logo "samsung.com" "logos/24-samsung.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Oracle_logo.svg/250px-Oracle_logo.svg.png" "logos/25-oracle.png"
download_company_logo "lvmh.com" "logos/26-lvmh.png"
download_company_logo "homedepot.com" "logos/27-home-depot.png"
download_company_logo "asml.com" "logos/28-asml.png"
download_company_logo "abbvie.com" "logos/29-abbvie.png"
download_company_logo "bankofamerica.com" "logos/30-bank-of-america.png"
download_wikipedia_logo "https://commons.wikimedia.org/wiki/Special:Redirect/file/Coca-Cola%20logo.svg?width=320" "logos/31-coca-cola.png"
download_company_logo "icbc.com.cn" "logos/32-icbc.png"
download_company_logo "netflix.com" "logos/33-netflix.png"
download_company_logo "merck.com" "logos/34-merck.png"
download_company_logo "nestle.com" "logos/35-nestle.png"
download_company_logo "roche.com" "logos/36-roche.png"
download_company_logo "chevron.com" "logos/37-chevron.png"
download_company_logo "astrazeneca.com" "logos/38-astrazeneca.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Salesforce.com_logo.svg/250px-Salesforce.com_logo.svg.png" "logos/39-salesforce.png"
download_company_logo "hermes.com" "logos/40-hermes.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/SAP_2011_logo.svg/250px-SAP_2011_logo.svg.png" "logos/41-sap.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/en/thumb/6/69/Kweichow_Moutai_Logo.png/250px-Kweichow_Moutai_Logo.png" "logos/42-kweichow-moutai.png"
download_company_logo "adobe.com" "logos/43-adobe.png"
download_company_logo "ihcuae.com" "logos/44-ihc.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/en/thumb/0/0e/Reliance_Industries.svg/250px-Reliance_Industries.svg.png" "logos/45-reliance-industries.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Toyota.svg/250px-Toyota.svg.png" "logos/46-toyota.png"
download_wikipedia_logo "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/AMD_Logo.svg/330px-AMD_Logo.svg.png" "logos/47-amd.png"
download_company_logo "pepsico.com" "logos/48-pepsico.png"
download_company_logo "novartis.com" "logos/49-novartis.png"
download_wikipedia_logo "https://commons.wikimedia.org/wiki/Special:Redirect/file/L%27Or%C3%A9al%20logo.svg?width=330" "logos/50-loreal.png"

if (( ${#failures[@]} > 0 )); then
  echo "Finished with fallback misses:"
  printf '%s\n' "${failures[@]}"
else
  echo "Done."
fi
