FROM ruby:3.1

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    default-mysql-client \
    yarn \
    unzip \
    wget \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    xdg-utils \
    libu2f-udev \
    libvulkan1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub  | apt-key add && \
    wget http://dl.google.com/linux/deb/pool/main/g/google-chrome-unstable/google-chrome-unstable_102.0.5005.22-1_amd64.deb && \
    apt-get install -y -f ./google-chrome-unstable_102.0.5005.22-1_amd64.deb

#ChromeDriver
ADD https://chromedriver.storage.googleapis.com/102.0.5005.61/chromedriver_linux64.zip /opt/chrome/
RUN cd /opt/chrome/ && \
    unzip chromedriver_linux64.zip
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/chrome

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
