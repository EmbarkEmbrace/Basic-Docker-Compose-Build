# Basic-Docker-Compose-Build
+ Node.js &amp; Redis
+ Generates a webpage that displays a number that goes up everytime you refresh the page.
 + ## docker-Compose.yml (Format = Explanation -> Text/command)
    + Specify version of docker-composd:
      + version: '3'
    + Telling the docker-compose file what you would like it to do:
      + Services:
        + Create container called "redis-server":
          + redis-server:
            + Use specific image:
              + image: 'redis'
        + Create container called "node-app":
          + node-app:
            + Use dockerfile in the current directory for the image ((build) Dockerfile must be present):
              + build: .
            + Specifiy ports to open in container:
              + ports:
                + detail ports (stars with a hyphen to specify an array):
                  + - '4001:8081'

 + ## Dockerfile
    + Specify a base image:
      + FROM node:alpine
    + Working directory:
      + WORKDIR /usr/app
    + Dependencies:
      + COPY ./package.json ./
        + Prevents dependencies from having to be re-installed every time index.js commit is made
          + Placement is important
      + RUN npm install
      + RUN npm install -g npm@8.4.0
        + As of (1/29/22)
      + COPY ./ ./
        + Copies source path to destination path
    + Default command
      + CMD ["npm", "start"]
  + ## index.js
    + creatClient enables connection between both containers, specifically from the Node.js container to redis-server container - upon starting the node.js container.
  
    + ![Screenshot from 2022-01-31 19-15-21](https://user-images.githubusercontent.com/75050777/151908108-e1ba34d1-d0c0-48f3-b735-01b745d2082c.png)

  + ## package.json
    + ![Screenshot from 2022-01-29 18-02-57](https://user-images.githubusercontent.com/75050777/151683879-dfea5a4f-3d9f-4159-a586-b82e9126dcda.png)
