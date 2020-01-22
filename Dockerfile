FROM node:10.15.3-stretch


# First, we copy just the needed files to do `npm install`. This way our build will not reinstall node modules if we just have changes to our source files
COPY . .

RUN npm i --engine-strict=true --progress=false --loglevel="error" \
    && npm cache clean --force


# We add an environmental variable that the app looks for to start the app with default url
ENV NODE_ENV=production \
    DISPLAY=unix:0.0 


# Define the command to run your app using `CMD` which defines your runtime.
CMD ["node", "index.js"]