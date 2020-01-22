FROM node:10.15.3-stretch


# First, we copy just the needed files to do `npm install`. This way our build will not reinstall node modules if we just have changes to our source files
COPY . .

RUN npm i --engine-strict=true --progress=false --loglevel="error" \
    && npm cache clean --force

RUN printf "deb http://httpredir.debian.org/debian stretch-backports main non-free\ndeb-src http://httpredir.debian.org/debian stretch-backports main non-free" > /etc/apt/sources.list.d/backports.list \
    && apt-get update -q && apt-get install -t stretch-backports -y -q --no-install-recommends \
    libx11-dev \
    libxtst-dev \
    libxt-dev \
    libx11-xcb-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev

# We add an environmental variable that the app looks for to start the app with default url
ENV NODE_ENV=production \
    DISPLAY=:0 


# Define the command to run your app using `CMD` which defines your runtime.
CMD ["node", "index.js"]