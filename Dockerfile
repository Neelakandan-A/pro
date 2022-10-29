FROM ubuntu
ENV email=mailtopro100@proton.me

# Add http server to serve the test.log
RUN apt-get update && apt-get upgrade -y && apt-get install python3 python3-pip bash -y
ADD ./webapp/requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt
# Add our code
ADD ./webapp /root/webapp/
WORKDIR /root/webapp
# Expose is NOT supported by Heroku
# EXPOSE 5000 

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
ENTRYPOINT ["sh", "-c", "/root/webapp/entrypoint.sh"]
