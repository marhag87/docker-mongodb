docker-meteor
=============

Docker container with Meteor


Some ways to run:

# DB data in container
sudo docker run --rm=true -t -i -p 8080:3000/tcp meteor
# DB data and code on host
sudo docker run --rm=true -t -i -p 8080:3000/tcp -v ~/git/dnd/:/mnt meteor
