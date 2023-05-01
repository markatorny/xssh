FROM ubuntu:focal
EXPOSE 80

RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/alahimajnurosama/xyz && \
    chmod +x /xyz/setup.sh && \
    /xyz/setup.sh

COPY . /app
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]
