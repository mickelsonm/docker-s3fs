# docker-s3fs

Creates a sync between AWS S3 and file system in container.

TODO: need to figure out why volumes doesn't work as expected between container and host.

How to build
---

    docker build -t s3fs .

How to run
---

    docker run -it --rm --cap-add mknod --cap-add sys_admin --device=/dev/fuse -e AWS_ACCESS_KEY=?? -e AWS_SECRET_ACCESS_KEY=?? -e AWS_S3_BUCKET=?? s3fs


Thanks for the help [Mukta](https://github.com/muktaa) and her [ awesome blog post that inspired this](https://muktaaa.wordpress.com/2014/12/26/mount-aws-s3-bucket-on-ubuntu-using-s3fs-docker-image/).
