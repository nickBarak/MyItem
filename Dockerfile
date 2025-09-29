FROM node
WORKDIR .
COPY . /home/app
EXPOSE 2020
RUN echo "MyItem app is running on port 2020..."
CMD ["node entry.js"]
