FROM node:10.15.3-stretch

RUN printf "deb http://httpredir.debian.org/debian stretch-backports main non-free\ndeb-src http://httpredir.debian.org/debian stretch-backports main non-free" > /etc/apt/sources.list.d/backports.list \
    && apt-get update -q && apt-get install -t stretch-backports -y -q --no-install-recommends \
    apt-utils \
    build-essential \
    dbus-x11 \
    libasound2 \
    libcanberra-gtk-module \
    libcurl3 \
    libexif-dev \
    libgconf-2-4 \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libgtk3.0 \
    libdrm-intel1 \
    libnotify4 \
    libnss3 \
    libusb-1.0-0 \
    libusb-1.0.0-dev \
    libxss1 \
    libxtst6 \
    libxcursor1 \
    python \
    xvfb \
    xauth \
    libx11-dev \
    libxtst-dev \
    libxt-dev \
    libx11-xcb-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev


# First, we copy just the needed files to do `npm install`. This way our build will not reinstall node modules if we just have changes to our source files
COPY . .

RUN npm i --engine-strict=true --progress=false --loglevel="error" \
    && npm cache clean --force

# We add an environmental variable that the app looks for to start the app with default url
ENV NODE_ENV=production \
    DISPLAY=:0 \
    IGNORE_GPU_BLACKLIST=false \
    NODE_TLS_REJECT_UNAUTHORIZED=0 \
    # nvidia card specific env vars
    PATH=/usr/local/nvidia/bin:$PATH \
    LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64


# Define the command to run your app using `CMD` which defines your runtime.
CMD ["node", "index.js"]