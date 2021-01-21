FROM node:12.20.1 as build
COPY . /workspace/
WORKDIR /workspace 
RUN npm install                                                                          
ENTRYPOINT ["npm","start"]


