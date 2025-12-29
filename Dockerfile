# Start from the image we know works
FROM alpine:3.19

# 1. Install Node.js, NPM, and Chromium (the browser)
RUN apk add --no-cache     nodejs     npm     chromium     nss     freetype     harfbuzz     ca-certificates     ttf-freefont

# 2. Set environment variables so Playwright knows where the browser is
ENV PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
ENV PLAYWRIGHT_CHROME_EXECUTABLE_PATH=/usr/bin/chromium-browser

# 3. Setup the project folder
WORKDIR /app
COPY package*.json ./
RUN npm install

# 4. Copy the rest of the code
COPY . .

# 5. Default command to run
ENTRYPOINT ["npx", "playwright", "test"]
