# Specify a base image, make sure you need to copy it from a predefined images where all your required functions are defined
FROM node:alpine

# Traversing to working directory, to prevent the conflict that might happen with docker files and our files we use relative path
WORKDIR /usr/app

# Just copy the package.json file because if we change source code and rebuild it will again install everything even though npm install 
# has nothing to do with source code . so just copy package.json file. Then after npm install copy everything.Copy minimal things at every step
# as much as possible
COPY ./package.json ./

# Install some depenendencies
RUN npm install

COPY ./ ./

# Default command
CMD ["npm", "start"]