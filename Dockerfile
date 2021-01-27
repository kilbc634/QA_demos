FROM tuyn76801/ubuntu-18.04:200820
ENV APP_NAME="QA_demos"
ENV LANG="C.UTF-8"
WORKDIR /home/${APP_NAME}

ADD ./ ./
RUN pip3 install --no-cache-dir -r requirements.txt
# install chrome
RUN apt update
RUN apt install -y unzip openjdk-8-jre-headless xvfb libxi6 libgconf-2-4
RUN apt install -y curl
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt -y update
RUN apt -y install google-chrome-stable
# change webdevice permission
RUN chmod 777 lib/chromedriver_linux
RUN chmod 777 lib/chromedriver_win.exe

CMD python3 -m robot .
