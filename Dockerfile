FROM alpine

RUN apk fix && \
  apk --no-cache --update add git git-lfs gpg less openssh patch \
  && adduser -D -u 1000 git-user \
  && mkdir /git \
  && chown -R 1000:1000 /git \
  && git lfs install

# Add safe directory to system /etc/gitconfig to avoid dubious ownership
RUN git config --system --add safe.directory "*"

USER 1000

VOLUME /git
WORKDIR /git


# These can be enabled to allow for testing via the shell
# ENTRYPOINT [ "sh", "-c" ]
# CMD ["git"]

ENTRYPOINT ["git"]
CMD ["--help"]
